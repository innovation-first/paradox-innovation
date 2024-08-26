---
title: "How to Deploy your Application ?"
description: "Step-by-step guide on deploying an application onto the Hub."
date: 2024-07-05T13:15:14+02:00
summary: 'This real live demonstration illustrates the Finops and Greenops monitoring of a sample AWS kubernetes application.'
---

## Getting Started

It all starts the [Thales Digital Gitlab repository](https://gitlab.thalesdigital.io). This is where we assume you developped one or several applications. 

For the sake of clarity, we will explain how you can deploy a sample [streamlit](https://streamlit.io/) application, a popular python framework do deploy simple but effective data or gen AI prototypes. A [sample streamlit application](https://gitlab.thalesdigital.io/tsn/innovation/projects/streamlit) is available for you to start from a working example. 

## The big picture

The Hub is, in fact, a managed [Kast](https://kast-portal.dpsc-thales.fr/) platform. That is to say, a managed Kubernetes cluster that provides ready to use security and database services. 

To deploy an application, you first need to get in touch with the Hub admin team that will provide you with two starting point: 

1. a dedicated Kubernetes namespace. This is where you will deploy your application.
2. Sample CI/CD, helm charts and documentations for you to generate docker images, and deploy them automatically to the Hub.

## Understanding the pieces and parts

### The Kubernetes Cluster

Kast is deployed on top of a google managed kubernetes (GKE). The GKE is *public* meaning that its control plane
is exposed (but protected of course) to the internet. The rationale is to provide all developpers with direct access to the cluster using their local kubectl/kastctl. If you work with the Hub you will work with a plain
Kubernetes cluster; using familiar kubectl commands. 

### The role of Kast

Why Kast then ? Kast provides us with two major goodies. First it allows us to easily deploy many components using the [kastctl](https://kast-portal.dpsc-thales.fr/static/files/kast-documentation/lts/fleche-6.4.0/kastctl.html?h=kastctl) cli. Kastctl lets you deploy your applications using helm charts or using so-called *kpacks* yaml files that provide interesting features to simplify your job of writing helm charts and values. 

Kastctl also provides very useful commands to deal with tokens and secrets which makes it easy to provide the required tokens to your application. 

### Docker Images

### CI/CD

### Helm Charts


## Contacts

- dimitri.tombroff@thalesgroup.com
- kevin.denis@thalesgroup.com
- olivier.jobert@thalesgroup.com






