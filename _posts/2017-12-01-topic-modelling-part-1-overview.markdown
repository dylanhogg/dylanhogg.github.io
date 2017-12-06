---
layout:     post
title:      "Topic Modelling Part 1: An Overview"
subtitle:   "How do I automatically organise thousands of documents?"
date:       2017-11-30 09:00:00
tags:       [Machine Learning, Topic Modelling]
author:     "Dylan Hogg"
header-img: "img/post-bg-02.jpg"
published:  true
comments:   true
---

<p style="color:red">BLOGPOST IN PROGRESS</p>

<h2 class="section-heading">What is Topic Modelling?</h2>

<p>Topic modelling is a useful approach for automatically organising a large collection of documents into topics. Automatic is the key here - we don’t require predefined document labels nor even predefined topics to perform the organisation. Topic modelling falls under a broader collection of methods within Natural Language Processing and Machine Learning.</p>

<p>TODO: get a image for topic modelling -> NLP -> ML</p>

<p>For example, thousands of New York Times articles (our collection of documents, also known as a corpus) can be organised into a number of topics. This could enable readers to visually explore stories within a particular topic or enable the publisher to recommend articles based on reader preferences.</p>

<p>TODO: get a image for topic modelling</p>

<p>Many methods have been developed for topic modelling over the past few decades. Most methods rely on the fact that a document is typically about a particular subject and has words that frequently occur together. For example, an email planning your next holiday will likely contain the words ‘flight’ and ‘hotel’ more often than emails about other subjects. It is this statistical regularity that allows latent topics to be discovered, sometimes as if by magic.</p>

<p>The only data required for topic modelling is the text within each document. In machine learning terminology, this is an unsupervised learning method - meaning that we don’t require labelled data as is the case with supervised learning methods. The number of topics to automatically discover typically needs to be specified which can be tricky and may depend on how the results will be used. Interpretation of the discovered topics can also be tricky; while they can often be summarised by their most important words, they do not necessarily correspond to topics we expected to find. Todo: add example</p>

<p>The following sections will describe (in roughly chronological order of discovery) the intuitions behind a few different methods of applying topic modelling.</p>

<h2 class="section-heading">Topic Modelling Methods</h2>

<h3 class="section-subheading">Latent Semantic Analysis (LSA)</h3>

<p>Latent Semantic Analysis (also known as Latent Semantic Indexing) is a method that boils </p>

<h3 class="section-subheading">Probabilistic Latent Semantic Analysis (PLSA)</h3>

<p>TODO</p>

<h3 class="section-subheading">Latent Dirichlet Allocation (LDA)</h3>

<p>TODO</p>

<h3 class="section-subheading">Non-negative Matrix Factorization (NMF)</h3>

<p>TODO</p>

<h3 class="section-subheading">Other Topic Modelling Methods</h3>

<p>TODO</p>

<h2 class="section-heading">Interpreting and Evaluating Topic Models</h2>

<p>TODO</p>

<h2 class="section-heading">Which Method or Algorithm to Choose?</h2>

<p>TODO</p>

<!-- 
<blockquote>Etiam pellentesque laoreet nulla, vel congue quam lobortis id. Etiam sagittis faucibus molestie. Proin sollicitudin dolor diam, non laoreet tortor porta non. Curabitur vitae lacinia enim.</blockquote>

<a href="#">
    <img src="{{ site.baseurl }}/img/post-sample-image.jpg" alt="Post Sample Image">
</a>
<span class="caption text-muted">To go places and do things that have never been done before – that’s what living is all about.</span>
-->
