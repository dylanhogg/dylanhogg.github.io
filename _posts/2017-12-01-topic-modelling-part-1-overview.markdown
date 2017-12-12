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

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">What is Topic Modelling?</h2>

<p>Topic modelling is a useful approach for automatically organising a large collection of documents into topics. Automatic is the key here - we don’t require predefined document labels nor even predefined topics to perform the organisation. Topic modelling falls under a broader collection of methods within Natural Language Processing and Machine Learning.</p>

<p>TODO: get a image for topic modelling -> NLP -> ML</p>

<p>For example, thousands of New York Times articles (our collection of documents, also known as a corpus) can be organised into a number of topics. This could enable readers to visually explore stories within a particular topic or enable the publisher to recommend articles based on reader preferences.</p>

<p>TODO: get a image for topic modelling</p>

<p>Many methods have been developed for topic modelling over the past few decades. Most methods rely on the fact that a document is typically about a particular subject and has words that frequently occur together. For example, an email planning your next holiday will likely contain the words ‘flight’ and ‘hotel’ more often than emails about other subjects. It is this statistical regularity that allows latent topics to be discovered, sometimes as if by magic.</p>

<p>The only data required for topic modelling is the text within each document. In machine learning terminology, this is an unsupervised learning method - meaning that we don’t require labelled data as is the case with supervised learning methods. The number of topics to automatically discover typically needs to be specified which can be tricky and may depend on how the results will be used. Interpretation of the discovered topics can also be tricky; while they can often be summarised by their most important words, they do not necessarily correspond to topics we expected to find. Todo: add example</p>

<p>The following sections will describe (in roughly chronological order of discovery) the intuitions behind a few different methods of applying topic modelling.</p>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Topic Modelling Methods</h2>

<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Prerequisite: Preparing the documents</h3>

<p>In order to discover topics within a corpus, the contents of all documents must be converted into a numerical format that becomes the input for a topic modelling method or algorithm. How this conversion is performed depends on a number of factors, for example, the chosen topic modelling method, the content of the documents themselves and also which language modelling simplifications are acceptable while still achieving the desired outcome.</p>

<p>One numerical format, that we will use below, is called a term-document matrix (where a term is simply a word from the vocabulary over all documents.) This format happens to discards word order and simply counts the number of occurrences of each term within a document. This simplification of ignoring word order (also known as a bag-of-words model) greatly reduces the complexity of representing the original  documents and can still produce good results.</p>

<p>The term-document matrix is a sparse matrix containing mainly zeros (since documents typically don't use all words) and represents each document as a column. Each entry is a count of the number of word occurrences in the document. While term-document matrices are common in information retrieval literature, for large datasets a document-term matrix having documents as rows can be easier to work with and is more common in software libraries.</p>

<p>The steps described here are very simple. There are many extensions that can be applied, for example, an entry in the term-document matrix can be extended to include the notion of term frequency–inverse document frequency (TF-IDF) which is a term weighting scheme. Regarding the vocabulary, in order to reduce the size of the term-document matrix, and also remove information that is often not useful, we can exclude common stop words (e.g. the, and, on) and likewise rare words that may only appear in a few documents. Additionally, word stemming can be applied such that only root words are included for analysis (e.g fished and fishes become fish.)</p>


<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Latent Semantic Analysis (LSA)</h3>

<p>Latent Semantic Analysis is a method developed in the late 1980’s that takes as input a term-document matrix and factorises this into 3 new matrices which are able to jointly reconstruct the original matrix. This is achieved by applying a linear algebra method called Singular Value Decomposition (SVD) where the factorisation can be represented as M = UΣV'.</p>
 
<p>Each factored matrix gives us an insight in potential topics latent in the original term-document matrix. Specifically, matrix U maps words to a topic space, matrix V maps documents to the same topic space and matrix Σ is a diagonal matrix that tells us the ‘strength’ of each topic - whereby strong topics capture more variance in the underlying data.</p>

<p>TODO: get a image for M = UΣV'</p>

<p>Knowing the strength (or variance) of the different topics is key. Strong topics allow us to model much of the original data while weak topics can be likened to modelling noise. Given this, we can choose to keep the top K topics and discard the rest. Specifically, a variant of SVD called truncated (also known as low-rank) SVD does precisely this and is an instance of dimensionality reduction such that we find the most important aspects of the data to enable the best approximate reconstruction of the original corpus. These important aspects are the topics we are seeking to model.</p>

<p>TODO: get a image for plotting values of Σ</p>

<p>Choosing an appropriate number of topics to keep can be difficult and may be dependent on the problem domain you are modelling. There are several approaches, one of the simplest being to choose a cut-off value within the strength matrix Σ, either automatically or after plotting the values to identify where the values plateau.</p>

<p>Given we have our truncated matrix factorisation with K topics, we also have a vector representation of each document over the topics, namely the columns of ΣV'. The final step to topic modelling with LSA is to apply a clustering method (for example K-means or a hierarchical clustering algorithm) over these resulting vectors.</p>

<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Probabilistic Latent Semantic Analysis (PLSA)</h3>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Latent Dirichlet Allocation (LDA)</h3>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Non-negative Matrix Factorization (NMF)</h3>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h3 class="section-subheading">Other Topic Modelling Methods</h3>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Interpreting and Evaluating Topic Models</h2>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Which Method or Algorithm to Choose?</h2>

<p>TODO</p>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">References</h2>

<p>TODO</p>

<!-- 
<blockquote>Etiam pellentesque laoreet nulla, vel congue quam lobortis id. Etiam sagittis faucibus molestie. Proin sollicitudin dolor diam, non laoreet tortor porta non. Curabitur vitae lacinia enim.</blockquote>

<a href="#">
    <img src="{{ site.baseurl }}/img/post-sample-image.jpg" alt="Post Sample Image">
</a>
<span class="caption text-muted">To go places and do things that have never been done before – that’s what living is all about.</span>
-->
