---
title: 'Introducing Nyx secure coding assistant'
date: 2024-08-08T13:48:14+02:00
summary: 'A collaborative and safe conversational agent'
categories: 
- Blog
tags:
- generative ai
image: 'shared/abstract-blue-boxes.jpg'
authors:
- Hugues Deghorain
---


{{< quote author="Jake Bengtson" source="Weighing the Open-Source, Hybrid Option for Adopting Generative AI, Harvard Business Review" url="<https://www.cloudera.com/campaign/weighing-the-open-source-hybrid-option-for-adopting-generative-ai.html">}}>
Nearly 70% of the 11,700 professionals who
responded to the survey on the Fishbowl app say they are
using those AI tools without their boss’s knowledge.
{{< /quote >}}


A R&D team from our company Nantes office, (Tanguy Jouannic, Pierre Doumenc and Olivier Jobert) designed and deployed an effective coding assistant to demonstrate how even the most secured air gap development environment can benefit from a powerful and feature rich coding assistsant. 

In this blog we briefly review the importance of coding assistant, and present that new assistant called **Nyx**.


## The landscape of coding assistants

### Why it matters

The arrival on the market of OpenAI's chatbot in November 2022 triggered the chase between artificial intelligence players who continue to make their assistants or models available. The contribution of digital technology to the transformation of many professions can benefit or even be disrupted. This is the case for the software development profession. Many of the players in Generative AI have developed coding assistants, in particular the main Cloud Providers via their own solutions or in partnership with now essential pure players such as [OpenAI](https://openai.com/) or [Anthropic](https://www.anthropic.com/). And the open source community is not left out. Many open solutions are thus pushed by the community. There are therefore a plethora of solutions available on which it is possible to rely to increase the productivity of software development teams.

A generative AI-based coding assistant is a tool that helps developers in their software development process. It can take different forms, but in general it is a system that is able to understand the source code and provide suggestions, advice and sometimes even generate entire portions of code to help developers write code more efficiently.

The benefit of using such a tool is multiple. First, it saves time by preventing developers from having to constantly search for documentation or best practices for every piece of code they write. The wizard can quickly provide them with the information they need, speeding up the development process, especially when developers need to learn a new software framework or even a new language.

Second, coding assistants can help developers improve the quality of their code. It can spot common errors, syntax oversights, or bad practices and report them to developers. This helps reduce bugs and improve the reliability of the developed software.

Finally, coding assistants can help train and guide less experienced developers. He can show them examples of code already written, explain key concepts and best practices, and help them progress in their career path.
[Ogma](/blogs/ogma) is a collaborative conversational agent based on generative AI, 
whose knowledge can be increased via proprietary data sources provided as pdf, docx, txt, confluence, etc.

### Benefits

Our company experience in the field of Generative AI for coding is based on studies, experiments within innovation projects in use on some development projects, and its use on customer projects.

From this experience comes our assessment of the expected gains. They are not far from what can be found in the literature.
The first effect induced by the use is obviously the increase in the performance of teams of developers depending on their profile (and level of seniority in particular) and the uses that are carried out with an assistant.

We should not believe that to date all developments can be achieved with Generative AI. However, we see that overall the improvement in productivity ranges from 15% to 35%. Depending on the tasks to be carried out and the experience of the developer, we can observe significantly higher gains on a case-by-case basis.

The interest is obvious when the developer must take charge of a little-known language. His skills development curve is accelerated. As an illustration, an application for collecting data from a ToF camera was created using the gStreamer library, unknown to the development team at the start of the project. The use of generative AI (Github Copilot in this case) by an experienced developer made it possible to divide the estimated completion times by 4 (1 week instead of 4).
In the case of code refactoring, an assistant helps accelerate the study phases of existing code by focusing on optimization. 

For transformation projects such as switching from one language to another, or from one language version to another, to reduce technical debt, Generative AI allows for a faster transition. AWS estimates that thanks to its [Amazon Q Code Transformation tool](https://aws.amazon.com/q/developer/code-transformation/#aws-page-content-main) the time to port Java 8 applications to Java 17 has gone from 2 days to 10 minutes.
The use of Generative AI helps accelerate time to market with higher quality products also thanks to better test coverage. Automatic code completion and systematic unit test generation features are now available and very popular with developers.

## Nyx

Nyx is an innovative initiative from our company to provide our projects with a development assistant based on generative AI to optimize development activity in dimensions such as those explained above.

Several initiatives exist within our division. This makes it possible to address in particular the needs related to security and confidentiality. Its architecture which can be deployed in a highly secure environment on On Premise infrastructures within our clients' information systems, or even on Air Gap and Offline infrastructures (without internet connection), without any access to equipment accessible from an external network. However, it can be deployed with Cloud Service Providers such as Google Cloud Platform, Amazon AWS, Microsoft Azure, to name a few.

Nyx relies, for the part assisting in the extension of IDEs, among other things, on the Open Source project of 
[continue.dev](https://www.continue.dev/) and in this sense makes it possible to control the maintenance of the security condition of the solution. It also makes it possible to control the underlying infrastructure and thereby rely on existing infrastructures such as HPC.
This also allows you to benefit from the functionality contributions of the community, which makes it robust over time.
It should be noted that under no circumstances is the client blocked by any Intellectual Property of our company since these are open-source components assembled and implemented by project teams.

Nyx can be completed with the [Ogma](/blogs/ogma) module allowing access to a corpus of company documents. 

### Features

The wizard functionalities provided by Nyx are those inherited from 
the [continue.dev](https://www.continue.dev/) project. Namely:

* A wizard provided as an extension to VSCode and IntelliJ.
* Interfaces with LLMs and their configuration
* The extension provides developers with the means, integrated into the IDE:
  * Code generation, completion, refactoring
  * Code documentation
  * Code explanation
  * Generation of tests
  * Migration to another programming language
  * Integrated chat
  * Vulnerability detection
  * Bug detection

### Work in progress

Nyx is demonstrated on the [Hub google cloud platform](/docs/hub-overview/). It is however meant to be deployed as part
of internal and secured development environment, which requires precise costs estimates: hom many GPUs,
how mny servers.  The nyx team is benchmarking what it takes, stay tuned for the reports.

## Contacts

- Olivier Jobert
- Pierre Doumenc
- Tanguy Jouannic