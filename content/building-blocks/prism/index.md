---
title: 'Prism'
date: 2026-03-05T10:00:00+02:00
summary: 'Strategic accelerator for agentic AI platforms at Thales Services Numérique'
image: 'shared/abstract-blue-2.png'
categories:
- Building Block
tags:
- genai
- platform
- governance
- kubernetes
authors:
- Dimitri Tombroff
- Maxime Daragon
---

## Why Prism exists

Generative AI is rapidly transforming how software systems are designed and operated.  
For large organizations, the challenge is no longer experimenting with LLMs, but **deploying governed, reliable, and scalable AI capabilities in real operational environments**.

Most teams quickly discover several structural difficulties:

- connecting AI capabilities to enterprise systems safely
- governing tool access and actions performed by agents
- managing knowledge ingestion and corpus lifecycle
- deploying and operating AI platforms in secure environments
- enabling delivery teams to build domain-specific assistants without rebuilding infrastructure every time.

Prism exists to address this challenge.

**Prism is the strategic accelerator through which Thales Services Numérique organizes its GenAI and agentic architecture capabilities**, combining open-source platform assets with deployment patterns and expert support to enable real business deployments.

## Prism in one sentence

Prism is a **Thales Services Numérique accelerator for agentic architectures**, combining deployable platform packages and expert capabilities to help teams deploy, operate, and scale enterprise-grade GenAI systems.

## What Prism provides

Prism is not a single product or environment.  
It is a **combination of reusable platform assets and expert capabilities** that provides:

- a curated platform base from open repositories
- architecture and governance guidance
- deployment blueprints and operational patterns
- enablement support for delivery teams and customer programs.

This model allows teams to **focus on business assistants and use cases** rather than rebuilding platform infrastructure.

## Strategic ambition

Prism plays a central role in the GenAI strategy of Thales Services Numérique:

- accelerate the adoption of governed GenAI platforms across the group
- enable delivery teams to industrialize **agentic architectures for customers**
- consolidate and structure **Thales Services Numérique offerings** around GenAI
- support internal transformations where AI assistants augment operations and expertise.

In short, Prism turns experimental GenAI capabilities into **deployable and supportable platforms for real programs**.

## Relationship with Fred and the Open Source Platform

Prism builds on a set of open-source platform assets, with **Fred** as the central foundation. Fred is an official Thales Group open-source platform focused on the infrastructure layer required for governed agent execution. It provides core capabilities such as agent runtime orchestration, knowledge ingestion and retrieval pipelines, governance mechanisms including tool approval and HITL, and integration with enterprise systems and tools.

Prism does not replace Fred. Instead, it organizes how this platform is used in real-world contexts. It defines how Fred-based platforms are packaged, deployed, governed, and supported across delivery teams and customer programs.

Alongside the main `fred` repository, Prism also relies on **fred-deployment-factory**, which provides deployment samples and reference blueprints used to accelerate platform setup.

In practice, the relationship is simple:

- **Fred provides the open platform foundation**
- **Prism enables its structured adoption, deployment, and delivery at scale**

For readers discovering this ecosystem:

- **2024:** Fred began as an agentic and multi-agent innovation experiment within the Frugal-IT innovation track.  
- **2025:** Fred evolved into a fully open-source platform.  
- **2026:** Prism emerged to organize how Fred-based platforms are deployed and delivered across Thales Services Numérique.

## What Prism is not

Prism is not:

- a fork or reimplementation of Fred
- a single deployed environment
- a centralized run team operating all customer instances
- a closed product disconnected from open source.

Prism is a **platform accelerator and operating model**.

## Responsibility split

| Scope | Prism core team | Delivery/Run teams | Business teams |
| --- | --- | --- | --- |
| Platform engineering roadmap (Fred) | Primary | Input | Input |
| Governance patterns and reference architecture | Primary | Co-owner for operations | Consumer |
| Deploy one instance for a given customer/context | Support | Primary | Consumer |
| Run and maintain each instance | Support | Primary | Consumer |
| Configure prompts/agents/corpus for domain usage | Guidance | Platform support | Primary |
| Build domain-specific business assistants | Guidance | Platform support | Primary |

This structure avoids confusion between:

- platform engineering
- deployment and operations
- business solution development.

It allows the Prism core team to focus on **reusable platform enablers**, while delivery teams scale concrete implementations.

## References

- [Fred repository](https://github.com/ThalesGroup/fred)
- [Fred Deployment Factory](https://github.com/ThalesGroup/fred-deployment-factory)
- [What are building blocks ?](/docs/what-are-building-blocks/)
- [Frugal-IT Optimiser blog](/blogs/frugalit-optimiser/)
- [Frugal-IT Adviser blog](/blogs/frugalit-adviser/)
- [Frugal-IT Inspector blog](/blogs/frugalit-inspector/)