---
title: 'Frugal Kubernetes'
date: 2024-07-16T13:48:14+02:00
summary: 'An experimental methodology to significantly reduce costs and energy footprints of Kubernetes applications'
categories:
- Innovation Track
tags:
- llm
- ai
- kubernetes
author: 'Dimitri Tombroff'
image: 'Robos-colaborativos-cobots-1.webp'
---

## Problem Statement

How can we reduce the energy footprint of a Kubernetes application ? 

Several innovation tracks explore this topic and have been recently put together in a single and homogenous software suite called
[frugal-it](/blogs/frugalit). 

In this blog we focus on our research methodology, and in particular how we use and plan to use generative AI to assist architects and system administrators
in the complex journey of optimizing their solution.  

For the sake of clarity we assume that 

* The user is a software architect that designed a complete Kubernetes solution. 
* that solution is an Iot end-to-end solution where remote probes and captors collect and ship some data to a central 
Kubernetes solution where that data is processed, saved and displayed.
* The user selected a number of components such as Queuing systems (Kafka), document stores (Elasticsearch), storage components (Minio, Cloud storage), and
dashboarding (Kibana, Superset, Grafana) to ultimately present the data products to the customers. 

This scenario is interesting becuse it is very popular and comman, and also because it is particularly easy to implement on top of the [Kast](/building-blocks/kast) distribution. 

## Global Approach


Our idea consists in using generative AI to provide guidance to the 
