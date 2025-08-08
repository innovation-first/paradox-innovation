---
title: "Building the Brains of Fred: A Summer of Agentic Innovation"
date: 2025-08-07T10:00:00+02:00
tags: ["fred", "agentic", "selfrag", "open-source", "frugal-it", "llm"]
categories: 
- Blog
authors: 
  - Dimitri Tombroff
  - Simon Cariou
  - Romain Perennes
  - Alban Capitant
  - FLorian Muller
draft: false
toc: false
image: "shared/image-from-rawpixel-id-5915594-jpeg.jpg"
---

## Summary

This summer has been productive across several AI and platform innovation tracks, with key advances in document understanding, agentic orchestration, observability, and enterprise readiness. Here's a short recap of what we've shipped and where we're heading.

---

## Rico Pro: A Self-Evaluating Document Expert

[Rico](https://fredk8.dev/blog/rico-learns-to-reflect-smarter-document-qa-with-self-rag-techniques/), our document-focused agent, learned to **think before answering**. Thanks to the Self-RAG pattern, Rico now:

- Grades retrieved documents before using them.
- Evaluates his own answers and retries intelligently.
- Uses LangGraph to manage this flow with explainable transitions.

This makes document Q&A more precise, auditable, and robust. Rico Pro is now the default in Fred and can be fine-tuned to any domain.

---

## 🕰️ Smarter Ingestion with Temporal Workflows

[Ingest Smarter, Not Harder](https://fredk8.dev/blog/ingest-smarter-not-harder-fred-gets-a-temporal-brain/) explains how Fred now leverages **Temporal** to orchestrate ingestion pipelines that are:

- Durable (with automatic retries)
- Observable (via the Temporal UI)
- Customizable (through Python-based workflows)

Push and pull ingestion are now modeled as precise, modular pipelines — ready to scale, debug, and extend. Whether you're batching 5 or 5,000 documents, Fred's ingestion is now as reliable as a modern microservice.

---

## AI Reviewers for Code and Deployment Consistency

Fred now ships with **two GPT-4-powered reviewer tools** to enforce software quality:

- [AI Code Reviewer](https://fredk8.dev/blog/bridging-the-dev-devops-gap-with-ai-deployment-review/): checks Python pull requests for violations of Fred’s architectural rules — ensuring layering, exception handling, and Pydantic use are respected.  
- [AI Deployment Reviewer](https://fredk8.dev/blog/using-ai-to-enforce-code-quality-in-fred/): detects mismatches between Python config models and deployment files like `values.yaml` and Dockerfiles, preventing misconfigurations before they hit production.

These tools reduce reviewer fatigue, prevent regressions, and bring AI into the loop where it matters most: **architecture, automation, and deployment safety**.

---

## Tabular Data Comes Alive with Tessa

[Tessa](https://fredk8.dev/blog/from-csv-to-agent-tabular-data-gets-smart-in-fred/), Fred’s new Tabular Expert, brings structured datasets like CSVs and Excel files into the world of agentic AI.

- Powered by a DuckDB backend and exposed through a flexible `BaseTabularStore`
- Uses LangGraph and a dedicated reasoning loop for SQL generation
- Answers questions like “What’s the average cost per region?” with verified, schema-aware queries

Tessa turns static spreadsheets into interactive knowledge — with markdown tables, LaTeX math, and explainable answers. It’s local, extensible, and ready to use in your Fred deployment. We use it for the Frugal DC project helping out datacenter colleagues to better grasp their consumption patterns.

--- 

## Fred x MCP: Open Architectures for Modular AI

[Fred x MCP](https://fredk8.dev/blog/expanding-fred-with-mcp-a-playground-for-next-gen-agentic-architectures/) marks a major step forward: Fred and knowledge-flow now **expose and consume components** over the [Model Context Protocol (MCP)](https://github.com/langchain-ai/mcp). This unlocks:

- Plug-and-play retrieval tools, like vector search via knowledge-flow.
- Real orchestration with external components like Kubernetes analyzers.
- Multi-agent delegation, where agents like Dominic or Explainer operate independently via MCP.

Fred becomes a living testbed for building interoperable, real-world AI systems — and you can wire up your own MCP tools in minutes.

--- 

## Join Us

If you're interested in explainable, agentic AI for documents and operations — whether in defense, industry, or critical infrastructure — visit [fredk8.dev](https://fredk8.dev) or reach out directly.

