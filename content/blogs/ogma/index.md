---
title: 'Ogma collaborative conversational agent'
date: 2024-08-07T13:48:14+02:00
summary: 'A collaborative and safe conversational agent'
categories: 
- Blog
tags:
- generative ai
image: 'shared/abstract-black-1.jpg'
authors:
- Tanguy Jouannic
- Olivier Jobert
- Pierre Doumenc
---

{{< quote author="Timothy Carambat" source="Anything LLM" url="https://docs.anythingllm.com/introduction">}}
You want a zero-setup, private, and all-in-one AI application for local LLMs, RAG, and AI Agents all in one place without painful developer-required set up ?

You need a fully-customizable, private, and all-in-one AI app for your business or organization that is basically a full ChatGPT with permissioning but with any LLM, embedding model, or vector database ?
{{< /quote >}}

If you responded yes, Ogma is of interest to you.

## Overview

Ogma is a collaborative conversational agent based on generative AI, 
whose knowledge can be increased via proprietary data sources (pdf, docx, txt, confluence, etc.).

{{< youtube gd4xkmzLWSQ >}}

## Architecture

Ogma has been built on top of state-of-the-art open source: 
- [Anything LLM](https://anythingllm.com/) a fully private AI framework
- [vLLM](https://docs.vllm.ai/en/latest/) for the inference server and the embedding server
- Different possible models: we mainly use [Llama3](https://ollama.com/library/llama3) The complete list of supported LLMs is available on the vLLM website as indicated above.
- [ChromaDB](https://www.trychroma.com/) for vector database.

## Features

Ogma's features are those inherited from the open-source AnythingLLM project. Namely:

* A modern web application 
* Interfaces with third-party components and their configuration (LLM, embedding model, vector database)
* The solution allows the following actions:
  * Increasing the model’s knowledge of selected documents
  * Interaction with the conversational agent on documents, the sources of which are cited
  * Document summary
  * Application user management
  * Monitoring of interactions

Our contributions to the Open Source solution concern the implementation of the infrastructure accompanied by the platform which hosts the inference server and its LLM, the embedding server and its embedding model, as well as the database vector.

Ogma is deployed on the innovation hub, and protected using Keycloack.

## Contacts

- Olivier Jobert
- Pierre Doumenc
- Hugues Deghorain
- Tanguy Jouannic





