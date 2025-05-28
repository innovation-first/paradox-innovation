---
title: 'Fred, MCP, and A2A — Demystified in 3 Minutes'
date: 2025-05-26T13:48:14+02:00
summary: 'Fred, MCP, and A2A — Demystified in 3 Minutes'
categories:
- Blog
tags:
- generative AI
- agentic
image: 'shared/abstract1.jpeg'
authors: 
- Fred Team
---

As AI systems get more modular and intelligent, you will or have already heard terms like **MCP**, **A2A**, 
and if working with Thales Services Numériques, possibly about **Fred**. If you’re a developer, architect, or decision-maker, here’s a no-nonsense breakdown.

---

## MCP: "The Plug Standard for Tools"

**MCP (Model Context Protocol)** is how AI agents talk to external systems — think **tools** like:

- Kubernetes clusters  
- Document databases  
- Forecasting engines  

It’s like **USB for AI**: agents send a standard request, tools respond in a standard way. That means you can swap tools or build new ones, and agents don’t break.

> Think: `Fred → ask tool for data → get answer back`

---

## A2A: "How Agents Talk to Each Other"

**A2A (Agent-to-Agent)** is how **AI agents talk to other AI agents**.

Instead of hardcoding which agent knows what, agents publish what they can do (via a `.well-known/agent.json` file), and others can **discover and delegate tasks dynamically**.

> Think: `Fred → delegate task to the best available expert → expert returns result`

---

## Fred: "The Conductor"

**Fred** is an open-source orchestration agent. It:

- **Plans** how to solve a user’s question  
- **Supervises** the execution  
- **Delegates** tasks to expert agents (via MCP or A2A)  

Fred is like the conductor of an orchestra — it doesn’t play every instrument, but it knows **who should do what** and in **what order**.
Fred was designed before MCP and A2A were around. It now already leverage MCP, and we are now starting to equip Fred with A2A to ease the interactions with expert agents. 

---

## How They Work Together

| Role         | Protocol Used | Example                                  |
|--------------|---------------|------------------------------------------|
| Fred → Tool  | **MCP**        | Ask a Kubernetes cluster for pod logs    |
| Fred → Agent | **A2A**        | Ask a finance agent to run a forecast    |
| Agent → Tool | **MCP**        | Document agent searches a vector DB      |

---

## Capabilities Exposed

**MCP is about tools, resources, and prompts.** These are defined by the server and used by agents at runtime — like APIs an agent can call.

**A2A is about skills.** Agents advertise what they can do (e.g., Translate, Analyze, Summarize) in a structured way, and negotiate modalities (text, files, audio) live during interactions.


## Why This Matters

- **Architects**: You can compose modular, language-agnostic systems  
- **Developers**: You can reuse tools and agents with minimal glue code  
- **Managers**: Faster prototyping, clearer responsibilities, real scalability  

No more monoliths. Just smart agents, speaking smart protocols.

---

## Get Started

👉 [Try Fred](https://gfredk8.dev)  
👉 [Explore MCP](https://github.com/github/github-mcp-server)  
👉 [Read about A2A](https://www.cohorte.co/blog/comparing-anthropics-model-context-protocol-mcp-vs-googles-agent-to-agent-a2a-for-ai-agents-in-business-automation)

