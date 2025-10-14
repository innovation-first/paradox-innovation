---
title: 'Assessing the Quality of Information Extraction: Methods, Metrics, and Emerging Benchmarks'
date: 2025-10-14T11:00:00+02:00
summary: 'A review of current approaches for evaluating document extraction performance — from ground-truth comparisons to advanced benchmarks like READoc, KIEval, and DUDE.'
categories:
- Innovation Track
tags:
- ai
- document-understanding
- evaluation
image: 'shared/abstract-white-4.webp'
authors:
- 'Julien Meynard'
- 'Charlotte Jacobé de Naurois'
---

## Assessing the Quality of Information Extraction: Overview of Methods and Recent Developments

Following our previous article, [**CLEAR: A Methodology for Smarter Document Understanding**](https://paradox-innovation.dev/blogs/clear/), this post focuses on the next logical question: **how can we measure the performance and reliability of document information extraction systems?**

At a time when AI-based extraction methods contribute to knowledge base enrichment and decision support, the issues of reliability and contextual accuracy have never been more critical. This article explores the main strategies, metrics, and benchmarks used today to evaluate extraction quality — from traditional ground-truth methods to the latest LLM-driven evaluation frameworks.

---

## Challenges in Evaluating Information Extraction

The evaluation of information extraction systems is not limited to merely verifying that a fact has been correctly identified: it is also about ensuring that each piece of information is linked to the right entity and property, without confusion or omission.  
This challenge becomes particularly significant in advanced domains, where human expertise is indispensable but difficult to mobilize at scale. Furthermore, the richness and diversity of language complicate the automation of evaluations, since the same idea can be expressed in many different ways. Adding to this is the intrinsic complexity of documents, where relevant information can also be hidden within images, structured tables, or graphs, or scattered in different parts of the document, making extraction even more complex for automated systems.

We will now describe the main strategies for evaluating the quality of extracted content without addressing operational concerns such as extraction time, robustness, or AI security — each of these topics would merit a dedicated analysis.

---

## Overview of the Main Methods for Evaluating the Quality of Extracted Content

### 1. Evaluation Based on Ground Truth

The most established method relies on manually annotated reference datasets, which serve as a ground truth against which extraction results can be compared.
From these annotated corpora, it becomes possible to compute objective metrics such as accuracy, precision, recall, or the F1-score, providing a quantitative assessment of model performance.

This approach has the merit of objectivity and reproducibility, since all systems are measured against the same reference set. It also facilitates straightforward comparison between algorithms.
However, it entails a significant cost in terms of dataset creation and maintenance, particularly in specialized domains where expert annotation is required. In addition, such comparisons often rely on exact matching between extracted and reference data, which can penalize semantically equivalent but differently phrased answers. This limitation makes it less suitable for tasks where meaning and contextual alignment are more important than literal correspondence.

---

### 2. "LLM as a Judge": Letting AI Evaluate AI

More recently, a growing body of research has explored the use of large language models (LLMs) as evaluators of other AI-generated outputs. In this paradigm, a model is prompted to rate or critique extraction results, assessing their correctness and relevance relative to the original document or expected answer.

This approach offers clear advantages in scalability and flexibility. It allows for the rapid evaluation of large volumes of data and can accommodate the wide variety of ways in which information may be expressed. Moreover, it reduces the dependence on costly human annotation, potentially accelerating experimental cycles.

Nevertheless, this method raises methodological concerns. Because the “judge” model often shares architectural or linguistic biases with the system under evaluation, results may be skewed toward self-consistency rather than objectivity. Variability across prompts or versions of the model can also reduce reproducibility. Finally, ensuring the independence and neutrality of such automated evaluators remains an open challenge for the research community.

---

### 3. Expert Human Opinion

Despite the rise of automation, expert evaluation remains indispensable for tasks where meaning, contextual adequacy, or domain precision play a decisive role. Human experts are uniquely capable of identifying subtle inconsistencies, understanding domain-specific terminology, and judging whether extracted content genuinely reflects the intent of the original document.

The main strength of this method lies in its depth of analysis and ability to detect nuanced errors that automated metrics might overlook. However, expert review is inherently time-consuming and costly, making it difficult to scale to large datasets. It also introduces an element of subjectivity, as different evaluators may apply distinct criteria or interpret ambiguous cases differently. For this reason, expert assessments are often used in combination with automated measures rather than as a standalone evaluation strategy.

---

### 4. Automated Similarity Metrics

Metrics such as BLEU or ROUGE can be used to automatically compare the extracted response with an expected answer, mainly based on lexical or semantic overlap.

**Strengths:**
- Fast, automatable, and suitable for ongoing monitoring  
- Based on exact n-gram overlap, which heavily penalizes valid reformulations or paraphrases; in extraction contexts, we seek fidelity to the original content  

**Weaknesses:**
- Originally designed for machine translation, not extraction tasks  
- Insensitive to sentence order or text coherence (METEOR partially addresses this).  

---

## Toward More Advanced Evaluation Methods

In response to persistent challenges, new frameworks are emerging such as the “LLM as a jury” approach. The idea is to place LLMs in an interactive debate, where several models argue to defend their answers, with the process adjudicated by human or automated judges.  
This collaborative and dynamic approach allows for a more comprehensive and nuanced assessment of performance.

Other approaches combine the previously mentioned metrics. For example, the benchmark proposed in the article **“READoc: A Unified Benchmark for Realistic Document Structured Extraction”** evaluates extraction from several perspectives:

- Accuracy of the extracted content (text, titles, formulas, tables)  
- Structural and hierarchical coherence (title trees, table structures)  
- Respect for the reading order (as in the original document)

Two main metrics are used:
- **EDS (Edit Distance Similarity)** — measures similarity using Levenshtein distance  
- **TEDS (Tree Edit Distance Similarity)** — measures similarity between hierarchical structures  

The article **“KIEval”** also proposes a metric that goes beyond the simple extraction of individual entities. Unlike classic metrics that only consider isolated key-value pairs, KIEval also takes into account the **structured relationships** between these entities — in other words, the model’s ability to correctly group related information (e.g., ensuring that “Menu.name” and “Menu.price” belong to the same set).  

---

## Benchmark Utilization

When implementing a content extraction solution, it is not always easy to find corpora of complete documents accompanied by ground truth. Here are a few significant benchmark contributions from the research community:

- **OmniDocBench** — focuses on end-to-end evaluation of PDF extraction quality across 9 document types, 4 layouts, and 3 languages.  
- **A Benchmark of PDF Information Extraction Tools** — evaluates 10 open-source tools using the large-scale DocBank dataset (1.5M annotated elements from 500k arXiv papers).  
- **DUDE (Document Understanding Dataset and Evaluation)** — introduces a benchmark for visually rich documents (VRD) with diverse layouts and the ANLS metric, inspired by DocVQA.  
- **dp-bench** — published on Hugging Face, compares extraction systems across 12 element types (tables, charts, captions, etc.) using NID, TEDS, and TEDS-S metrics.  

Together, these benchmarks highlight the trend toward **comprehensive and realistic evaluation** — not only assessing correctness, but also structure, relationships, and visual context.

---

## In Conclusion

Information extraction within documents can be evaluated along several dimensions: the choice of terms used, the preservation of general ideas, and the comprehensive retrieval of all ideas expressed in the original text.  
AI-based approaches accelerate the evaluation process, but they are not without drawbacks: aside from hallucinations inherent to these systems, they currently do not replace the expertise of top human evaluators.  
Regardless of the tool chosen, the most important aspect remains to combine approaches in order to achieve a robust and relevant assessment, tailored to each application context.

---

## References and Further Reading

- [Limitations of the LLM-as-a-Judge Approach for Evaluating LLM Outputs in Expert Knowledge Tasks](https://arxiv.org/abs/2410.20266)  
- [A Survey on LLM-as-a-Judge](https://arxiv.org/abs/2411.15594)  
- [READoc: A Unified Benchmark for Realistic Document Structured Extraction](https://arxiv.org/abs/2409.05137)  
- [OmniDocBench: Benchmarking Diverse PDF Document Parsing with Comprehensive Annotations](https://arxiv.org/abs/2412.07626)  
- [A Benchmark of PDF Information Extraction Tools using a Multi-Task and Multi-Domain Evaluation Framework for Academic Documents](https://arxiv.org/abs/2303.09957)  
- [Document Understanding Dataset and Evaluation (DUDE)](https://arxiv.org/abs/2305.08455)  
- [KIEval: A Knowledge-grounded Interactive Evaluation Framework for Large Language Models](https://arxiv.org/abs/2402.15043)  
- [dp-bench Dataset on Hugging Face](https://huggingface.co/datasets/upstage/dp-bench)

---

