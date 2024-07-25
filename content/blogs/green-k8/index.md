---
title: 'Frugal Kubernetes'
date: 2024-07-16T13:48:14+02:00
summary: 'An experimental methodology to significantly reduce costs and energy footprints of Kubernetes applications'
categories:
- Blog
tags:
- llm
- generative ai
- kubernetes
authors: 
- 'Dimitri Tombroff'
- 'Lorenzo Girardi'
- 'Tanguy Jouannic'
- 'Dorian Finel'
- 'Reyyan Tekin'
image: 'ar_inline_benefits_of_cd4ml.jpg'
---

## Overview 

{{< quote author="Thoughtworks" source="Build an AI strategy that survives first contact with reality" url="https://www.thoughtworks.com/insights/articles/build-an-ai-strategy-that-survives-first-contact-with-reality">}}
*For AI solutions to achieve lasting value, businesses need an iterative strategy paired with experimentation, robust engineering practices, and guardrails.*
{{< /quote >}}

This paper explains our strategy to design the [frugal-it](/blogs/frugalit) innovative greenops solution.
The goal of this paper is to challenged and helped bu you, the readers.

### Problem Statement

Our goal is to help architects, developpers and maintainers (referred to as users in the following) 
to reduce significantly the resources usage of their Kubernetes solutions. We plan to help them in three ways:

1. assist the users in understanding why their solution consume too much ressources
2. suggest to users possible optimisations and facilitate their evaluation
3. provide users with recommendations to help them identify if their solution complies to the best greenops practices and regulations.

### Why is it important

* Kubernetes is the de-facto standard service orchestrator platform. It is available on all clouds and on premise. It is in particular strategic to Thales defense and critical systems products and projects.
* 80% of cloud kubernetes ressources are under-utilized, leading to high energy consumption and costs.
* the technologies to scale down (i.e. reduce automatically) kubernetes applications exist but require a high expertise.
* frugality and cost optimisation are secondary concern, the first concern is robustess and continuous service.

## Sample Use Case

For the sake of clarity we will assume that 

* The user is a software architect that designed a complete Kubernetes solution. 
* that solution is an Iot end-to-end solution where remote probes and captors collect and ship some data to a central 
Kubernetes solution where that data is processed, saved and displayed.
* The user selected a number of components such as Queuing systems (Kafka), document stores (Elasticsearch), storage components (Minio, Cloud storage), and
dashboarding (Kibana, Superset, Grafana) to ultimately present the data products to the customers. 

Such popular architectural pattern is interesting because is is commonly used in various cybersecurity, IoT, Scada (civilian or milutary) solution. These are typicallt the applications we deal with in Thales. 
Besides, it is particularly easy to implement on top of the [Kast](/building-blocks/kast) distribution. 

## Work Hypothesis


### Input Data

The input data 

Our idea consists in using generative AI to provide guidance to the 
