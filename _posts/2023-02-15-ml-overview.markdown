---
layout:     post
title:      "Machine Learning Introduction"
subtitle:   "Overview of machine learning and common algorithms"
date:       2023-02-15 09:00:00
tags:       [Machine Learning, Data]
author:     "Dylan Hogg"
header-img: "img/post-bg-04.jpg"
published:  true
comments:   true
---

<style>
    .center {
      width: 60%;
      margin: 0 auto;
    }
</style>

<h2 class="section-heading" id="what-is-ml">What is Machine Learning?</h2>

<a href="https://en.wikipedia.org/wiki/Machine_learning">Machine Learning</a> (ML) is a subfield of AI that develops algorithms to automatically improve performance on a specific task from data, without being explicitly programmed to perform the task. For example, using historical price data to do well at the task of predicting future stock prices. Or using text data from the internet to do well at the task of engaging in human-like conversation.

ML has a rich, and at times fuzzy, history stemming from many fields including <a href="https://en.wikipedia.org/wiki/Statistics">Statistics</a>, <a href="https://en.wikipedia.org/wiki/Computational_statistics">Computational Statistics</a>, <a href="https://en.wikipedia.org/wiki/Artificial_intelligence">Artificial intelligence</a> and <a href="https://en.wikipedia.org/wiki/Computer_science">Computer Science</a>.

Regardless of the precise definition of ML, there are a few essential ingredients: a specific user defined task, input data matching the task, a method or algorithm that uses the data to produce output results, and a way of evaluating the result.

<a href="/img/ml-overview/dalle_robot_studying.png"><img src="/img/ml-overview/dalle_robot_studying.png" alt="A machine diligently learning" class="center" /></a>
<span class="caption text-muted">A machine diligently learning.<br />Source: <a href="https://labs.openai.com/s/8OVSlwHKBKIvwYXP371ItL4v">DALL·E</a></span>

<h2>Families of ML Algorithms</h2>

An <a href="https://en.wikipedia.org/wiki/Algorithm">algorithm</a> is a set of rules used for solving a problem or performing a computation. There are several families of ML algorithms that typically have different qualities of input data and achieve different task objectives.

<a href="/img/ml-overview/types_of_algorithms.png"><img src="/img/ml-overview/types_of_algorithms.png" alt="Machine Learning Types" /></a>
<span class="caption text-muted">Machine Learning Types.<br />Source: <a href="https://en.proft.me/2015/12/24/types-machine-learning-algorithms/">en.proft.me</a></span>

<h3>1. Supervised Learning</h3>

<a href="https://en.wikipedia.org/wiki/Supervised_learning">Supervised learning</a> algorithms operate on labelled examples, where each data point has features (also known as attributes) and an associated known true label value. For example, features of a patient medical condition with a known label of the disease.

If you have labelled data, supervised learning algorithms learn a function that maps input feature vectors to the output label. Within supervised learning there are different types of algorithms depending on your data and task objective. 

<a href="https://en.wikipedia.org/wiki/Statistical_classification">Classification</a> algorithms are used when the outputs are restricted to a limited set of label values.

<a href="https://en.wikipedia.org/wiki/Regression_analysis">Regression</a> algorithms are used when the outputs may have any numerical value.

<h3>2. Unsupervised Learning</h3>

If you have data with no labels, <a href="https://en.wikipedia.org/wiki/Unsupervised_learning">unsupervised learning</a> algorithms can be used to discover patterns. Within unsupervised learning there are also different types of algorithms depending on your data and task objective. 

<a href="https://en.wikipedia.org/wiki/Cluster_analysis">Clustering</a>, for example discovering customer segmentations based on behavioural patterns where the segments are unknown ahead of time.

<a href="https://en.wikipedia.org/wiki/Association_rule_learning">Association mining</a>, discovering interesting relations between features in large datasets, for example to power a product recommendation engine.

<a href="https://en.wikipedia.org/wiki/Dimensionality_reduction">Dimensionality reduction</a>, where data is transformed from a high dimension (with many features) into a lower dimension (fewer features). This can help with data visualisation, data summarisation and improve downstream efficiency for further analysis.

<h3>3. Semi-supervised Learning</h3>

Semi-supervised learning (also known as weak learning) is a middle ground between supervised and unsupervised approaches, especially when gathering supervised datasets is costly. This approach uses labelled and unlabelled data to create weak labels on the unlabelled subset and may produce better models than supervised methods alone.

Semi-supervised learning is widely used in many applications such as <a href="https://en.wikipedia.org/wiki/Natural_language_processing">natural language processing</a>, <a href="https://en.wikipedia.org/wiki/Computer_vision">computer vision</a>, and <a href="https://en.wikipedia.org/wiki/Speech_recognition">speech recognition</a>, where labeled data is often scarce, but large amounts of unlabelled data are available.

<h3>4. Reinforcement learning</h3>

<a href="https://en.wikipedia.org/wiki/Reinforcement_learning">Reinforcement learning</a> is quite different from the other methods described above. It is the training of an ML model that directs an agent to make a sequence of actions in an environment. For example, self-driving cars, playing chess, minimising energy consumption in data centres.

The agent interacts with the environment and receives feedback in the form of rewards or penalties, and uses this information to improve its decision making over time. Reinforcement learning well-suited for problems where it's difficult to explicitly program an optimal solution, or where the optimal solution may change over time.

Due to its generality, reinforcement learning is studied in many disciplines, such as <a href="https://en.wikipedia.org/wiki/Game_theory">game theory</a>, <a href="https://en.wikipedia.org/wiki/Control_theory">control theory</a>, <a href="https://en.wikipedia.org/wiki/Operations_research">operations research</a>, and <a href="https://en.wikipedia.org/wiki/Multi-agent_system">multi-agent systems</a>.

<h3>5. Deep learning</h3>

<a href="https://en.wikipedia.org/wiki/Deep_learning">Deep learning</a> involves training artificial neural networks (inspired by the structure of the brain) on large amounts of data and using the learned representations for a variety of tasks. The word "deep" in "deep learning" refers to the number of layers through which the data is transformed.

Deep learning is an approach that encompasses each of the families of algorithms described above. For supervised learning tasks, deep learning methods eliminate <a href="https://en.wikipedia.org/wiki/Feature_engineering">feature engineering</a>, by translating the data into compact intermediate representations. An example of unsupervised deep learning is a <a href="https://en.wikipedia.org/wiki/Deep_belief_network">Deep belief network</a>, while <a href="https://en.wikipedia.org/wiki/Deep_reinforcement_learning">Deep reinforcement learning</a> is an active area of research.

Deep learning has been very successful in a variety of applications and has outperformed traditional machine learning algorithms on many tasks. This is partially due to an abundance of data and faster GPUs in recent years, as well as advancements in training methods.

<a href="/img/ml-overview/deep_learning.png"><img src="/img/ml-overview/deep_learning.png" alt="Deep learning in relation to ML and AI" class="center" /></a>
<span class="caption text-muted">Deep learning in relation to ML and AI.<br />Source: <a href="https://en.wikipedia.org/wiki/Deep_learning">Wikipedia</a></span>

<h2 class="section-heading" id="which-algo">Which Algorithm Should I Use?</h2>

Choosing the right machine learning algorithm depends on a number of factors, including the type of problem you are trying to solve, the size and quality of your data, the desired interpretability of the result, and the computational resources you have available.

Identifying the family of algorithms based on your specific task is the first step, followed by trying one or more algorithms. Often there is no single “best” algorithm for a given problem. In many cases, an <a href="https://en.wikipedia.org/wiki/Ensemble_learning">ensemble of multiple algorithms</a> can produce better results than a single algorithm.

Here is a quick start cheat-sheet to help select an algorithm from the popular Python ML package, <a href="https://scikit-learn.org/">scikit-learn</a>:

<a href="/img/ml-overview/sklearn_cheat_sheet.png"><img src="/img/ml-overview/sklearn_cheat_sheet.png" alt="Algorithm selection cheat-sheet" /></a>
<span class="caption text-muted">Algorithm selection cheat-sheet<br />Source: <a href="https://scikit-learn.org/stable/tutorial/machine_learning_map/index.html">scikit-learn</a></span>

And here are a couple more algorithm selection cheat-sheets, from <a href="https://www.datacamp.com/cheat-sheet/machine-learning-cheat-sheet">Datacamp</a> and <a href="https://learn.microsoft.com/en-us/azure/machine-learning/algorithm-cheat-sheet">Microsoft</a>.

<h2 class="section-heading" id="common-algos">Common Classification Algorithms</h2>

The following list gives you an idea of the more common classification algorithms. For a much broader list see <a href="https://en.wikipedia.org/wiki/Outline_of_machine_learning#Machine_learning_methods">Outline of Machine Learning</a> on Wikipedia or the scikit-learn <a href="https://scikit-learn.org/stable/user_guide.html">documentation</a>.

<ul><li>
<strong><a href="https://en.wikipedia.org/wiki/Logistic_regression">Logistic Regression</a> </strong>– models the probability of an output
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Decision_tree">Decision Trees</a> </strong>– builds a tree branching on input values and class predictions in the leaves
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Random_forest">Random Forests</a> </strong>and <strong><a href="https://en.wikipedia.org/wiki/Gradient_boosting">Gradient Boosted Machines</a> </strong>– ensembles of decision trees
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Support_vector_machine">Support Vector Machines</a> </strong>– finds a maximum margin hyper-plane that differentiates two classes
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm">K-Nearest Neighbours</a></strong> Classification – an instance is classified by vote of its nearest neighbours
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Naive_Bayes_classifier">Naïve Bayes Classifier</a></strong> – probabilistic classifiers with strong independence assumptions between the features
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Artificial_neural_network">Neural Networks</a></strong>, Deep Learning, LSTM’s, CNN’s, RNN’s
</li></ul>

<h2 class="section-heading" id="types-of-algos">Types of ML Algorithms</h2>

It can be useful to understand the different types of algorithms and be aware of different qualities they may have from each other. For example:
<ul><li>
<strong><a href="https://en.wikipedia.org/wiki/Instance-based_learning">Instance based algorithms</a> </strong>- uses whole dataset as the model<br>E.g., kNN finds the most similar labelled instances for a given example and returns the most common label as predicted class
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Machine_learning#Models">Model based algorithms</a> </strong>- uses training data to create a model with learned parameters<br>E.g., Logistic regression uses an optimisation algorithm to find optimal parameters. This model predicts a probability for a new instance belonging to a certain class
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Parametric_model">Parametric algorithms</a> </strong>– make assumptions about the mapping of the input variables to the output variable and can summarise the data with a set of parameters of fixed size (independent of the number of training examples)<br>E.g., Logistic Regression, Naive Bayes, Neural Networks
</li><li>
<strong><a href="https://en.wikipedia.org/wiki/Nonparametric_statistics">Non-parametric algorithms</a> </strong>– make few or no assumptions about the target function<br>E.g., kNN, Decision Trees, Support Vector Machines
</li></ul>

<h2 class="section-heading" id="experimentation">Experimentation</h2>

Experimentation is important when developing a machine learning model. It allows testing of different hypotheses and evaluating the effectiveness of various algorithms, parameters, and architectures. This provides insights into the strengths and weaknesses of models, identifying areas for improvement to achieve better performance. 

Experimentation also enables the practitioner to evaluate the model's generalisation ability, which is crucial for ensuring that the model can make accurate predictions on unseen data. This aspect of training a model will be covered in a future post.

I recommend playing with the <a href="https://playground.tensorflow.org/">TensorFlow Playground</a> which lets you create, run and experiment with simple neural networks on sample data. This is a great way to get a intuition about what a network can and cannot learn.

<a href="/img/ml-overview/tensorflow-playground.png"><img src="/img/ml-overview/tensorflow-playground.png" alt="TensorFlow Playground" /></a>
<span class="caption text-muted">TensorFlow Playground.<br />Source: <a href="https://playground.tensorflow.org/">playground.tensorflow.org</a></span>

<h2 class="section-heading" id="next-steps">Next Steps</h2>

In followup posts I’ll cover how ML algorithms actually learn from data, as well as ways to ensure you train a good model by addressing model complexity, overfitting and data splits.

If you really want to jump into ML, I also recommend <a href="https://www.andrewng.org/">Andrew Ng</a>’s fantastic Stanford CS229 lecture series available on youtube. Have fun!

<iframe width="560" height="315" src="https://www.youtube.com/embed/jGwO_UgTS7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
