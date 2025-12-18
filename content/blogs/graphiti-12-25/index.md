---
title: "Building an Evidence-First Knowledge Graph for Industrial GraphRAG"
date: 2025-12-12T10:00:00+02:00
summary: "A pragmatic look at what Graphiti writes to Neo4j when you ingest engineering documents, and why that graph is a solid foundation for evidence-first GraphRAG agents."
tags: ["genai", "graph", "rag", "agents"]
categories:
- Blog
authors:
  - Thomas Hedan
  - Dimitri Tombroff
image: "shared/abstract-blue-boxes.jpg"
draft: false
toc: true
---

This post summarizes a small and preliminary experiment: ingest a structured engineering corpus with [Graphiti](https://github.com/getzep/graphiti), store it in [Neo4j](https://neo4j.com/), and inspect what actually lands in the graph. The goal is not to demo a chatbot or prompt engineering; it is to understand what Graphiti builds and whether that structure is useful for traceability-heavy agent workflows.

## Graphiti in a nutshell

[Graphiti](https://github.com/getzep/graphiti) is an ingestion/memory layer that turns unstructured text into a queryable knowledge graph (here, in [Neo4j](https://neo4j.com/)). In practice, the workflow looks like this:

- Split documents into coherent chunks (“episodes”).
- For each episode, extract entities and relationship statements (“facts”) using an LLM.
- Persist everything with provenance, so a relationship can be traced back to the text that supports it.

The following illustration shows the resulting graph after ingestion, as displayed in the Neo4j UI.

{{< figure src="graph.svg" alt="Simplified view of the resulting graph structure (episodes, entities, communities)" class="center" >}}

The rest of this post walks through what we observed in Neo4j: the node labels and relationship types created by Graphiti, and what that structure enables for retrieval and reasoning. Your exact nodes and edges may vary depending on the model and ingestion settings, but the overall schema and patterns are consistent.

## Where Graphiti fits (GraphRAG, LightRAG, HippoRAG)

The naming in this space can be confusing because some terms describe an end-to-end system and others describe a pattern. The way we frame it:

- [GraphRAG](https://github.com/microsoft/graphrag) is a family of retrieval-and-generation patterns that use a graph structure (entities, relations, communities) to retrieve and compose evidence.
- Graphiti is a tool that builds and maintains the underlying evidence graph (episodes, entities, relationship facts, provenance) that a GraphRAG-style agent can query.

At a high level (and with some simplification), you can think of it as:

| Name | What it is (in practice) | Where Graphiti differs |
|---|---|---|
| [GraphRAG](https://github.com/microsoft/graphrag) | A query-time strategy: retrieve via entities/communities/paths, then synthesize answers with citations. | Graphiti is not the answering strategy; it focuses on graph construction and provenance. |
| [LightRAG](https://github.com/HKUDS/LightRAG) | Lightweight, “fewer moving parts” GraphRAG-style implementations that mix vectors + simple graph expansion. | Graphiti emphasizes a persistent graph with explicit episodic evidence and a Neo4j-friendly model. |
| [HippoRAG](https://github.com/OSU-NLP-Group/HippoRAG) | RAG/memory approaches inspired by episodic recall and multi-hop retrieval over stored traces. | Graphiti makes episodic traces first-class in the graph and links facts back to those traces. |

These approaches are not mutually exclusive: Graphiti can be the ingestion backend, while your agent applies a GraphRAG/LightRAG/HippoRAG-style retrieval policy on top.

## Why we chose Graphiti in the Fred ecosystem

Beyond the graph model itself, Graphiti is attractive in an industrial stack because it is easy to integrate and deploy: it runs as a regular service in a containerized environment and does not require hardware-specific dependencies. That matters if your target is on-premise and safety/industrial environments, not only data-science prototypes.

In our case, we picked Graphiti because it allowed us to implement, in the open-source [Fred](https://fredk8.dev) ecosystem, a dedicated “library processor” component:

- It runs on a document library (Markdown, text, etc.).
- It ingests and enriches those documents into Neo4j following the evidence graph pattern described in this post (episodes, entities, relations with provenance).
- It keeps that graph up to date independently from the chat/agent runtime.

On top of that graph, we introduced an agent called Richard that explores hybrid strategies combining classic RAG (fast passage retrieval) with graph traversal (structured multi-hop reasoning) to improve answer quality and traceability. If you want the Fred-specific view of that work, see: https://fredk8.dev/blog/richard-vs-rico-agentic-duel-in-fred/

## What we tested

We ran an experiment involving:

- a small but realistic engineering document corpus,
- ingestion using [Graphiti](https://github.com/getzep/graphiti),
- storage and querying using [Neo4j](https://neo4j.com/),
- and systematic inspection of the resulting graph structure.

The objective is to answer a deeper question:

> What does Graphiti actually build in Neo4j when ingesting engineering documents, and why does this structure form a reliable foundation for evidence-driven GraphRAG agents?

The target audience is engineers who care about system engineering, safety analysis, IVVQ, and traceability constraints, but who may be new to GraphRAG, Graphiti, or Neo4j.

## Test corpus: nature and intent

### Corpus description

The test corpus is a fictional yet realistic set of engineering documents designed to emulate artifacts commonly found in industrial and safety-critical environments.

The corpus includes:

- System requirements (e.g. `SYS-REQ-01`, `SYS-REQ-05`, `SYS-REQ-08`)
- Safety requirements (e.g. `SAF-REQ-01`, `SAF-REQ-03`, `SAF-REQ-04`)
- Software components (e.g. `SW-COMP-01 – RadarSignalProcessor`)
- Hazards/risks (e.g. `HAZ-01`, `HAZ-02`, `HAZ-03`)
- IVVQ test cases (e.g. `TC-01`, `TC-02`, `TC-04`, `TC-05`)
- Anomalies (e.g. `ANOM-01`, `ANOM-02`)
- A change request (e.g. `CR-012`, impacting a radar processing component)

The corpus is intentionally limited in size (about 40 chunks after ingestion) but highly structured, so the value lies in relationships and dependencies rather than text volume.

## Ingestion pipeline: from documents to graph

We intentionally kept the ingestion code minimal, to avoid “baking in” a domain model and to observe what Graphiti produces by itself. The pipeline is:

1. Read Markdown and text files from a directory.
2. Apply semantic chunking to split documents into coherent segments.
3. Send each chunk to Graphiti as an episode, together with basic metadata (document name, timestamps, source description).

The important point is what we did not do: we did not implement explicit entity extraction, relation typing, or ontology mapping in our ingestion code. Graphiti (backed by an LLM) is responsible for turning episodic text into entities and relationship statements with provenance.

Conceptually, ingestion boils down to one call per chunk:

```python
await graph.add_episode(
    name=name,
    episode_body=text,
    source=EpisodeType.text,
    source_description=description,
    reference_time=datetime.now(timezone.utc),
)
```

In other words: the primary ingested object is text. Everything “graph-like” (entities, links, communities, and supporting evidence) is inferred and stored by Graphiti.

## Graph structure produced by Graphiti

At the Neo4j level, the resulting graph consistently follows the same pattern: a grounding layer of episodic text, a layer of extracted entities, and links that carry explicit provenance.

In our run, we observed three main node labels:

- `Episodic`: one chunk of text (one episode per chunk)
- `Entity`: a concept or engineering artifact inferred from the text
- `Community`: a semantic cluster grouping related entities

And three main relationship types:

- `(:Episodic)-[:MENTIONS]->(:Entity)`: an entity is mentioned in a given text chunk
- `(:Entity)-[:RELATES_TO]->(:Entity)`: an extracted assertion (“fact”) links two entities
- `(:Community)-[:HAS_MEMBER]->(:Entity)`: communities group entities

What makes this useful in practice is the evidence model:

- `Episodic` nodes store immutable textual evidence (raw chunk content plus metadata such as document name, timestamps, and source).
- `Entity` nodes store a stable `name` (often the engineering identifier), plus derived fields such as a summary and embeddings for semantic search.
- `RELATES_TO` edges are not just “an edge exists”: they carry a natural-language `fact` and references back to supporting episodes, which makes each relationship auditable.

## What looked good in the resulting graph

From manual inspection and a few simple traversals, four properties stood out:

- Connectivity: starting from `SW-COMP-01 – RadarSignalProcessor`, one or two hops reach system requirements, safety requirements, hazards, test cases, and anomalies. This is the kind of local connectivity you want for impact analysis.
- Artifact-centric reasoning: even if a change request (`CR-012`) initially connects to high-level concepts, downstream links connect back to concrete artifacts (components, requirements, tests, anomalies), which matches real engineering workflows.
- Provenance: provenance exists at two levels: `MENTIONS` links text to entities, and `RELATES_TO` links entities through an explicit `fact` with supporting episodes. This supports evidence-first reasoning and traceability.
- Generic labels with usable semantics: entities are not heavily typed, but engineering identifiers (prefixes like `SYS-REQ`, `SAF-REQ`, `TC`, etc.) provide enough structure for filtering and post hoc typing.

## Implications for agent design

Compared to plain vector RAG, this kind of graph changes what the agent can do: it can traverse explicit dependencies (entities and relationships) and it can cite the underlying evidence (episodes) that supports each link.

This naturally leads to an evidence-first answering policy: treat supported links as “known”, treat missing links as “unknown”, and surface traceability gaps instead of smoothing them over.

Architecturally, it also encourages a separation of responsibilities:

- Graph layer: path discovery, filtering, scoring.
- Evidence layer: fetch supporting episodes for each claim.
- Language layer: synthesize a readable answer from the evidence and the discovered structure.

## Limitations

The experiment also highlights two limitations that are often acceptable early on:

- Untyped relations: relationships are generic (`RELATES_TO`). In many cases, the `fact` text contains enough signal to type relations post hoc using rules or classifiers, without re-ingestion.
- Untyped entities: entities share a common label. Naming conventions and identifiers can still provide a pragmatic first-pass typing (and you can refine progressively).

## Practical next steps

If you want to build an agent on top of this kind of graph, a few high-leverage follow-ups are:

- Add lightweight typing (rules or classifiers) for common entity prefixes and for frequently observed `RELATES_TO.fact` patterns.
- Add retrieval guardrails: always return supporting episodes, and treat “no path / no evidence” as a first-class outcome.
- Start with one workflow (impact analysis, test coverage, change request triage) and encode it as a small set of Cypher traversals.

## Conclusion

Even with a minimal ingestion pipeline, [Graphiti](https://github.com/getzep/graphiti) plus [Neo4j](https://neo4j.com/) produces an evidence-rich knowledge graph from engineering documents. The graph has explicit entities with stable identifiers, relationships with textual provenance, short reasoning paths, and a usable grounding layer for traceability-heavy, graph-first agents.

## Appendix: representative Cypher queries

```cypher
CALL db.labels();
CALL db.relationshipTypes();

MATCH (ep:Episodic)-[:MENTIONS]->(e:Entity)
RETURN ep.name, e.name
LIMIT 20;

MATCH (a:Entity)-[r:RELATES_TO]->(b:Entity)
RETURN a.name, b.name, r.fact, size(r.episodes)
LIMIT 20;

MATCH (comp:Entity)
WHERE comp.name STARTS WITH "SW-COMP-01"
MATCH p=(comp)-[:RELATES_TO*1..4]-(x:Entity)
WHERE x.name =~ '^(SYS-REQ|SAF-REQ|HAZ|TC|ANOM|CR)-.*'
RETURN x.name, length(p)
ORDER BY length(p);
```

## References

- [Graphiti](https://github.com/getzep/graphiti)
- [Neo4j](https://neo4j.com/)
- [GraphRAG (Microsoft)](https://github.com/microsoft/graphrag)
- [LightRAG](https://github.com/HKUDS/LightRAG)
- [HippoRAG](https://github.com/OSU-NLP-Group/HippoRAG)
