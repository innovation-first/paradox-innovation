---
title: 'Boosting developer experience with Dev Containers and Docker Compose: A look inside the Fred project'
date: 2025-05-21T09:15:56+02:00
summary: 'Dev Containers and Docker Compose in Action: Fred Project Case Study'
categories:
- Blog
tags:
- development
- devcontainer
- docker compose
image: '/shared/abstract-blue-2.png'
authors: 
- Fabien Le-Solliec
- Simon Perennes
---

Modern development environments are complex. Configuring them consistently across machines is time-consuming and error-prone. The Fred project provides an elegant solution to this with its integration of **Dev Containers** and **Docker Compose**—two powerful tools that streamline development and onboarding.

## What Are Dev Containers and Docker Compose?

- **Dev Containers** are isolated, reproducible environments that developers can use in tools like Visual Studio Code. These containers encapsulate the entire development stack—tools, libraries, configurations—ensuring a consistent experience.
- **Docker Compose** is a tool for defining and running multi-container Docker applications. It allows you to configure services, networks, and volumes with a single YAML file.

Together, they solve a crucial problem: ensuring that developers can spin up a full development environment with a single command, regardless of their local machine setup.

## Why It Matters For Any Project

Here’s why this setup stands out:

### ✅ 1. Reproducible Environments
Every developer gets the *exact same environment*. The Dockerfile installs specific versions of Node.js, Python, and project dependencies, removing "it works on my machine" issues.

### 🚀 2. Faster Onboarding
New contributors can clone the repo, open it in VS Code, and launch a fully configured dev environment in minutes. All backend services come online automatically via Docker Compose.

### 🧩 3. Modular & Scalable
Services are decoupled. Need to debug OpenSearch? Just restart that container. Want to simulate cloud identity management? Keycloak is ready to go.

### 🔐 4. Real-World Simulation
The inclusion of MinIO and Kubernetes allows developers to build and test features against real-world systems locally.

## Why It Matters for Fred

[Fred](https://github.com/ThalesGroup/fred) isn’t a simple monolith — it’s a multi-repository, multi-agentic platform built to support advanced use cases like document ingestion, vectorization, semantic search, and interaction with large language models (LLMs). It orchestrates multiple services: web frontends, backend APIs, storage layers, AI agents, and integrations with both internal and external LLM providers.

Even developing a seemingly simple feature—like extracting content from a document—can require coordinating PostgreSQL, MinIO, OpenSearch, and multiple microservices. Testing this locally, in isolation, would typically be error-prone and time-consuming.

This challenge is even greater at Thales, where most developers work on secured laptops and need to interact with on-premise GenAI services and restricted corporate environments. The Dev Containers in Fred have been carefully designed to be compatible with both personal and secured corporate laptops, allowing developers to work effectively across setups while preserving consistency and security.

By packaging all dependencies and infrastructure in a standardized, portable containerized environment, Dev Containers and Docker Compose make it possible to spin up the entire Fred stack reliably—whether you’re onboarding a new contributor or testing complex agent workflows.

## The Fred Project Setup

The Fred project includes a rich `.devcontainer` directory with three essential components:

- `devcontainer.json` — The main config that tells VS Code how to start the development container.
- `Dockerfile-devcontainer` — Builds the custom dev container image, bundling both frontend and backend toolchains.
- `docker-compose-devcontainer.yml` — Coordinates service dependencies (like PostgreSQL and OpenSearch) during development.

The core services are defined in a broader `docker-compose.yml` under the `deploy/` folder, which includes:

- **PostgreSQL** for data persistence.
- **Keycloak** for identity and access management.
- **OpenSearch and OpenSearch Dashboards** for analytics and observability.
- **MinIO** for object storage.
- A lightweight **Kubernetes cluster (K3s)** for simulating cloud environments.

## Quick Start in VS Code

Want to test it out? Here's how to get going in just a couple of minutes:

1. **Install prerequisites**:
   - Docker (make sure it's running)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - [Dev Containers extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. **Clone the repository**:
   ```bash
   git clone https://github.com/ThalesGroup/fred.git
   cd fred
   ```

3. **Open the folder in VS Code**:
   - Either from the command line: `code .`
   - Or via File > Open Folder...

4. **Reopen in Container**:
   - VS Code should prompt: *"Reopen in Container?"* — click it.
   - Or open the command palette (`Ctrl+Shift+P`), then run: `Dev Containers: Reopen in Container`.

5. **You're in!**
   - The container builds automatically.
   - All services spin up with `docker-compose`.
   - You’re ready to start coding, testing, and debugging immediately.

## Final Thoughts

The Fred project is a textbook example of how to leverage Dev Containers and Docker Compose to supercharge your development workflow. Whether you're working solo or managing a distributed team, tools like these help maintain consistency, improve productivity, and reduce setup friction.
