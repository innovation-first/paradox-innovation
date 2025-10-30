---
title: "GenAI in 2025 — The AI Agents Hype and Thales Opportunities"
date: 2025-10-29T10:00:00+02:00
tags: ["genai", "ai-agents", "thales", "innovation", "reference"]
categories:
- Blog
authors:
  - Thomas Elhing
  - Fred Team
image: "shared/abstract3.jpg"
draft: false
toc: true
---

{{< admonition note "Source" >}}
This article draws on  
**[GenAI in 2025: The AI Agents Hype and Thales Opportunities](https://blog.mcs.thalesdigital.io/blog/2025_ai_agents/)**  
by *Thomas Ehling*, published February 12 2025 on the *Thales Digital MCS Blog* (internal access),  
and introduces the new **Fred Playground** recently deployed on **Thales Digitap**.
{{< /admonition >}}

---

## A brief recap — GenAI and the Agentic Shift

In his February 2025 article, Thomas captured the growing maturity of Generative AI inside Thales.  
He traced the evolution from Machine Learning to Generative AI and now to AI Agents — autonomous systems that plan, reason, and act through tools and APIs.

{{< figure src="agents.webp" width="240px" alt="Agents logo" class="center" >}}

He emphasized how Retrieval-Augmented Generation (RAG) made LLMs usable on company data, and how agentic architectures now bring true autonomy by combining:
- **Reasoning** (Chain of Thought),
- **Memory & Reflection**, and
- **Tool Integration** (APIs, databases, code execution).

Thomas also showcased multiple internal use cases — from Thales GPT to BidGPT — and highlighted [Fred](https://fredk8.dev), the open-source multi-agent orchestrator released by Thales Services Numérique, as one of the key enabler of this new wave.

---

## 2. From Vision to Reality — The Fred Playground on Thales Digital Platform

Building on that vision, we recently deployed an instance of Fred on the TDP environment — a managed Kubernetes cluster used as a sandbox for experimentation with AI agents.

This initiative provides Thales colleagues a hands-on environment to explore and compare different categories of agents:
- **RAG Agents** querying enterprise document stores,  
- **Supervisor Agents** monitoring **OpenSearch**, **Kubernetes**, or system health,  
- **Integration Agents** interacting with **Jira**, APIs, or external MCP servers.

All these agents deployed and securely running in one consistent framework.

---

## 3. A One-Day Deployment, Kubernetes-Native by Design

What made this deployment remarkable was its speed.  
The entire playground was operational in less than a day thanks to **Fred’s Kubernetes-native Helm charts**, which automate the provisioning of all required services:

| Component | Role |
|------------|------|
| **Keycloak** | Authentication and user management |
| **MinIO** | Object storage for document and agent data |
| **OpenSearch** | Vector and metadata storage |
| **Fred Backend (Python)** | Agentic orchestration, WebSocket streaming |
| **Fred UI (React)** | Chat interface and dashboards |

Once deployed, the platform immediately exposed its agent hub and chat UI, enabling instant interaction with preconfigured agents such as the *RAG Expert*, *Supervisor*, and *Kubernetes Watcher*.

This out-of-the-box setup demonstrates Fred’s design goal:  
> “From zero to a working multi-agent environment in one day — entirely cloud-native.”

---

## 4. From Concept to Practice

The Fred Playground  marks a concrete step in bringing the *AI Agents vision* described by Thomas into everyday experimentation.

It serves three purposes:
1. **Exploration** — Give Thales engineers a safe space to test, extend, and benchmark AI agents.  
2. **Integration** — Show how agents can interact with enterprise systems (K8s, Jira, OpenSearch).  
3. **Acceleration** — Lower the barrier to entry with fast, reproducible, secure deployments.

By combining open-source transparency with Thales’ managed infrastructure, the playground bridges innovation and production readiness. This was and still is our initial goal in both Fred and TDP teams.

---

## 5. Reference

> **Ehling, Thomas.**  
> *GenAI in 2025: The AI Agents Hype and Thales Opportunities.*  
> *Thales Digital MCS Blog*, February 12 2025.  
> [https://blog.mcs.thalesdigital.io/blog/2025_ai_agents/](https://blog.mcs.thalesdigital.io/blog/2025_ai_agents/) _(Internal access required)._

---

## 6. Next Steps

The Fred Playground will continue evolving as new agents join the ecosystem — including data analysis, monitoring, and reporting assistants.  
Contributors across Thales Digital Platforms are encouraged to explore, build, and connect their own agents using the same Kubernetes-native deployment stack.

> *AI agents are no longer just a concept — they’re a running service you can try today on Thales Digital Platform.*
