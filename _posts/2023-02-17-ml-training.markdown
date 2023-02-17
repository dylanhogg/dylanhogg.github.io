---
layout:     post
title:      "Machine Learning Model Training"
subtitle:   "How does a Machine Learning Algorithm actually learn?"
date:       2023-02-17 09:00:00
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
    .center-large {
      width: 75%;
      margin: 0 auto;
    }
</style>

<h2 class="section-heading" id="what-is-ml">What is Machine Learning?</h2>

<h2>How does an ML Algorithm actually learn?</h2>

<p>There are many types of ML algorithms. In this post I will discuss <a href="https://en.wikipedia.org/wiki/Supervised_learning">supervised learning</a> algorithms. These operate on labelled data, where each data point has one or more features (also known as attributes) and an associated known true label value.</p>

<p>The goal of supervised machine learning is to develop an algorithm that can learn from labelled data to train a model and then use the model to make accurate predictions on unseen test data. All without being <em>explicitly</em> programmed to do so.</p>

<a href="/img/ml-productionisation/programming_vs_ml.jpeg"><img src="/img/ml-training/programming_vs_ml.jpeg" alt="programming vs ML" class="center" /></a>
<span class="caption text-muted">Classical programming contrasted with machine learning<br />Source: <a href="https://twitter.com/kpaxs/status/1163058544402411520">twitter.com/kpaxs</a></span>

<p>An algorithm learns from training data by iterating over labeled examples and optimising model parameters to minimise the difference between label predictions and true labels. It is this <em>optimisation </em>component that enables “learning”.</p>

<p>Some algorithms are quite simple with few parameters to tune (for example <a href="https://en.wikipedia.org/wiki/Logistic_regression">logistic regression</a>) while others are very complex (for example <a href="https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)">transformer deep learning models</a>). Below we’ll cover the trade-offs between different algorithms and the subtleties of training a model that generalises well for predictions.</p>

<h2>Components of an ML Algorithm</h2>

<p>A typical ML algorithm consists of a few essential components:</p>

<ol><li>
<p>A <strong><a href="https://en.wikipedia.org/wiki/Loss_function">loss function</a></strong> (which applies to a single training example)</p>
</li><li>
<p>An <strong>objective (or cost) function</strong> (usually the summation of the loss function over all the examples in the dataset)</p>
</li><li>
<p>An <strong><a href="https://en.wikipedia.org/wiki/List_of_optimization_algorithms">optimisation algorithm</a></strong> to update learned parameters and improve the objective function</p>
</li></ol>

<p>Let’s use a linear regression model as an example, where the weights (<em>w</em>) and bias (<em>b</em>) are the parameters of the model to learn, <em>x</em> is a single input data instance and <em>f(x)</em> is the prediction for <em>x</em>.</p>

<p>Here’s the linear model formulation:</p>

<a href="/img/ml-training/components_eq1.png"><img src="/img/ml-training/components_eq1.png" alt="squared area loss function" class="center" style="width:35%" /></a>
<span class="caption text-muted">squared area loss function</span>

<p>And the components:</p>

<ol><li>
<p>The <strong>squared area loss function</strong> (applies to a single training instance):</p>
<a href="/img/ml-training/components_eq2.png"><img src="/img/ml-training/components_eq2.png" alt="linear regression model" class="center" style="width:35%" /></a>
<span class="caption text-muted">linear regression model</span>
<p>The <strong>mean squared error (MSE) objective function</strong> applies to the whole dataset:</p>
<a href="/img/ml-training/components_eq3.png"><img src="/img/ml-training/components_eq3.png" alt="mean squared error (MSE) objective function" class="center" style="width:45%" /></a>
<span class="caption text-muted">mean squared error (MSE) objective function</span>
<p>An <strong>optimisation algorithm</strong>. One possible example is <a href="https://en.wikipedia.org/wiki/Gradient_descent">Gradient Descent</a>, since the objective function is differentiable. (Another option is a closed form solution, but that isn’t always solvable when the dataset is large).</p>
</li></ol>

<h2>Gradient Descent Optimisation Algorithm</h2>

<p><a href="https://en.wikipedia.org/wiki/Gradient_descent">Gradient Descent</a> is a first-order iterative optimisation algorithm for finding a local minimum of a differentiable function. It’s commonly used to optimise linear regression, logistic regression and neural networks.</p>

<p>The basic idea behind gradient descent is to take steps in the direction of the negative gradient of the objective function with respect to the parameters. The negative gradient informs the direction in which the objective function is decreasing most rapidly, so taking a step in that direction should quickly reach a minimum.</p>

<p>There are several variations of gradient descent, such as <a href="https://en.wikipedia.org/wiki/Stochastic_gradient_descent">stochastic gradient descent</a>, which uses a random subset of the data to update the parameters in each iteration, and mini-batch gradient descent, which uses a small batch of data to update the parameters in each iteration.</p>

<p>It shouldn’t be confused with <a href="https://en.wikipedia.org/wiki/Backpropagation">backpropagation</a>, which is an efficient method of computing gradients in a directed graphs of computations (for example in neural networks).</p>

<a href="/img/ml-training/graddescent_1.png"><img src="/img/ml-training/graddescent_1.png" alt="Gradient Descent" class="center" /></a>
<span class="caption text-muted">Gradient Descent<br />Source: <a href="https://www.samlau.me/test-textbook/ch/11/gradient_stochastic.html">www.samlau.me</a></span>

<a href="/img/ml-training/graddescent_2.png"><img src="/img/ml-training/graddescent_2.png" alt="Stochastic Gradient Descent" class="center" /></a>
<span class="caption text-muted">Stochastic Gradient Descent<br />Source: <a href="https://www.samlau.me/test-textbook/ch/11/gradient_stochastic.html">www.samlau.me</a></span>

<p>The <a href="https://en.wikipedia.org/wiki/No_free_lunch_theorem">No Free Lunch Theorem</a> is a concept that states that there is no one model that works best for every problem. The theorem essentially says that if an algorithm performs well on a certain set of problems, then it must necessarily perform worse on others.</p>

<p>The assumptions of a great model for one problem may not hold for another problem, so it is common to try multiple models and find one that works best for a particular problem.</p>

<h2>Under and Over-fitting</h2>

<p><a href="https://en.wikipedia.org/wiki/Overfitting#Underfitting">Underfitting</a> and <a href="https://en.wikipedia.org/wiki/Overfitting">overfitting</a> are common problems that can occur when training models.</p>

<p>Underfitting occurs when the model is too simple to capture the underlying patterns in the data. In other words, the model is not complex enough to fit the training data, and it performs poorly on both the training and testing data.</p>

<p>Overfitting occurs when the model is too complex and fits the training data too well, including the noise in the data. In this case, the model is not able to generalise to new, unseen data and performs poorly on the test data.</p>

<p>Both underfitting and overfitting can lead to poor performance and inaccurate predictions. The goal is to find the right balance between model complexity and performance on the training and testing data. Techniques such as <a href="https://en.wikipedia.org/wiki/Cross-validation_(statistics)">cross-validation</a>, <a href="https://en.wikipedia.org/wiki/Regularization_(mathematics)">regularisation</a>, and <a href="https://en.wikipedia.org/wiki/Early_stopping">early stopping</a> can help to prevent overfitting and underfitting in machine learning models.</p>

<a href="/img/ml-training/overfitting.png"><img src="/img/ml-training/overfitting.png" alt="Examples of under/good/over fitting" class="center-large" /></a>
<span class="caption text-muted">Examples of under/good/over fitting<br />Source: <a href="https://medium.com/greyatom/what-is-underfitting-and-overfitting-in-machine-learning-and-how-to-deal-with-it-6803a989c76">Anup Bhande</a></span>

<h2>Bias and Variance</h2>

<p><a href="https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff">Bias and variance</a> are two important concepts that relate to the ability of a model to accurately capture the underlying patterns in the data.</p>

<p>Bias refers to the error that is introduced by approximating a real-world problem with a simplified model. A model with high bias is unable to capture the complexity of the underlying patterns in the data and may result in underfitting.</p>

<p>Variance, on the other hand, refers to the error that is introduced by the model's sensitivity to small fluctuations in the training data. A model with high variance is too complex and may result in overfitting. In other words, a model with high variance is too sensitive to the noise in the training data and may fail to generalise to new, unseen data.</p>

<a href="/img/ml-training/bias_variance.png"><img src="/img/ml-training/bias_variance.png" alt="Bias/variance intuition" class="center" /></a>
<span class="caption text-muted">Bias/variance intuition<br />Source: <a href="https://towardsdatascience.com/understanding-the-bias-variance-tradeoff-165e6942b229">Seema Singh</a></span>

<h2>Bias / Variance Tradeoff</h2>

<p>Bias and variance trade off against each other. This tradeoff is a central problem in supervised learning.</p>

<p>The goal is to find the right balance between bias and variance to achieve the best predictive performance on new, unseen data. Techniques such as regularisation, cross-validation, and ensembling can help to balance bias and variance in machine learning models.</p>

<p>Ideally, we want a model that accurately captures the regularities in its training data and generalises well to unseen data. Unfortunately, it is typically impossible to do both simultaneously.</p>

<ul><li>
<p>Expected generalisation error is the sum of the bias and variance error</p>
</li><li>
<p>Overfitting: low bias, high variance</p>
</li><li>
<p>Underfitting: high bias, low variance</p>
</li></ul>

<a href="/img/ml-training/bias_variance_tradeoff.png"><img src="/img/ml-training/bias_variance_tradeoff.png" alt="Bias/variance error decomposition" class="center-large" /></a>
<span class="caption text-muted">Bias/variance error decomposition<br />Source: <a href="https://djsaunde.wordpress.com/2017/07/17/the-bias-variance-tradeoff/">Daniel Saunders</a></span>

<h2>Training/Validation/Test Data Splits</h2>

<p><a href="https://en.wikipedia.org/wiki/Training,_validation,_and_test_data_sets">Training, validation, and test data splits</a> are used to evaluate the performance of a model on new, unseen data. These data splits are used to train the model, tune its hyperparameters, and evaluate its performance.</p>

<p>The training set is the part of the data that is used to train the model. It is the data on which the model is fitted, and its parameters are optimised to minimise the objective function.</p>

<p>The validation set is used to evaluate the performance of the model with different hyperparameter values and select the best set of hyperparameters.</p>

<p>The test set is the part of the data that is used to evaluate the final performance of the model. It is a new, unseen dataset that the model has not been trained on or used to tune hyperparameters. The test set is used to estimate the performance of the model on new, unseen data and to determine if the model is generalising well.</p>

<p>It is important to keep the test set separate from the training and validation sets to avoid overfitting and to obtain an unbiased estimate of the model's performance. If there is not enough labelled, cross-validation is another option.</p>

<a href="/img/ml-training/data_splits.png"><img src="/img/ml-training/data_splits.png" alt="Data splits" class="center-large" /></a>
<span class="caption text-muted">Data splits<br />Source: <a href="https://towardsdatascience.com/train-test-split-and-cross-validation-in-python-80b61beca4b6">Adi Bronshtein</a></span>

<h2>Hyperparameters</h2>

<p><a href="https://en.wikipedia.org/wiki/Hyperparameter_(machine_learning)">Hyperparameters</a> in machine learning are model settings that cannot be learned during training but must be set before the training process begins. They control the behaviour of the model and can have a significant impact on its performance.</p>

<p>Hyperparameters are typically set by the user and are not learned from the data. They can include settings such as the learning rate, the number of hidden layers in a neural network, the number of trees in a random forest, the regularisation strength, or the kernel type in a support vector machine.</p>

<p>Finding the right hyperparameter values is essential to ensure that the model performs well on new, unseen data. They can be difficult to set, as their optimal values can depend on the dataset, the model architecture, and the specific problem being solved. </p>

<p>There are many approaches to hyper-parameter optimisation, for example:</p>

<ul><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Hyperparameter_optimization#Grid_search">Grid search</a> </strong>– simple parameter sweep</p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Hyperparameter_optimization#Random_search">Random search</a> </strong>– can <a href="https://jmlr.csail.mit.edu/papers/volume13/bergstra12a/bergstra12a.pdf">outperform Grid search</a></p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Hyperparameter_optimization#Bayesian_optimization">Bayesian optimisation</a> </strong>- builds a model of the function mapping from hyper-parameter values to the objective</p>
</li></ul>

<h2>Regularisation</h2>

<p><a href="https://en.wikipedia.org/wiki/Regularization_(mathematics)">Regularisation</a> is an umbrella term of methods that force the learning algorithm to build a less complex model. It is any modiﬁcation we make to a learning algorithm that is intended to reduce its <a href="https://en.wikipedia.org/wiki/Generalization_error">generalisation error</a> but not its training error.</p>

<p>Regularisation examples:</p>

<ul><li>
<p><strong>L1 regularisation (aka <a href="https://en.wikipedia.org/wiki/Lasso_(statistics)">lasso regression</a>) </strong>– adds the <em>absolute value </em>of the model coefficients as a penalty term to the loss function. (many coefficients tend to 0 which helps with feature selection)</p>
</li><li>
<p><strong>L2 regularisation (aka <a href="https://en.wikipedia.org/wiki/Ridge_regression">ridge regression</a>) </strong>– adds the <em>squared value </em>of the model coefficients as a penalty term to the loss function. (L2 is differentiable meaning gradient descent can be used to optimise the objective function)</p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Early_stopping">Early stopping</a></strong></p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Data_augmentation">Data Augmentation</a></strong></p>
</li><li>
<p>For neural networks:</p>
    <ul><li>
    <p><strong><a href="https://en.wikipedia.org/wiki/Dilution_(neural_networks)#Dropout">Dropout</a></strong>: randomly "dropping out" units during training</p>
    </li><li>
    <p><strong><a href="https://en.wikipedia.org/wiki/Batch_normalization">Batch normalisation</a></strong>: re-centering and re-scaling layer inputs</p>
    </li></ul>
</li></ul>

<h2>Learning Curves</h2>

<p>A <a href="https://en.wikipedia.org/wiki/Learning_curve_(machine_learning)">learning curve</a> is a graph that shows how the performance of a model changes as the size of the training set increases or the model complexity increases. </p>

<p>Learning curves are used to diagnose the bias-variance tradeoff of a model and to determine whether the model is underfitting or overfitting. They can also be used to determine if more data will improve the model, evaluate the effect of regularisation, perform feature selection, and hyperparameter tuning on the performance of the model.</p>

<a href="/img/ml-training/learning_model_complexity.png"><img src="/img/ml-training/learning_model_complexity.png" alt="Model complexity learning curve" class="center-large" /></a>
<span class="caption text-muted">Model complexity learning curve<br />Source: <a href="https://learnopencv.com/bias-variance-tradeoff-in-machine-learning/">Satya Mallick</a></span>

<a href="/img/ml-training/learning_trainingset_size.png"><img src="/img/ml-training/learning_trainingset_size.png" alt="Training set size learning curve" class="center" /></a>
<span class="caption text-muted">Training set size learning curve<br />Source: <a href="https://upload.wikimedia.org/wikipedia/commons/9/90/Variance-bias.svg">wikimedia</a></span>

<h2>Assessing Model Performance</h2>

<p>To assess the performance of a machine learning model, several evaluation metrics can be used. The choice of the metric depends on the specific problem and the type of model being used.</p>

<p>Here are some common evaluation methods and metrics:</p>

<ul><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Confusion_matrix">Confusion matrix</a> </strong>summarises predictions vs true labels</p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Precision_and_recall#Precision">Precision</a></strong>: fraction of relevant instances <em>among the retrieved instances</em></p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Precision_and_recall#Recall">Recall</a></strong>: fraction of relevant instances <em>that were retrieved</em></p>
</li></ul>

<a href="/img/ml-training/precision_recall.png"><img src="/img/ml-training/precision_recall.png" alt="Precision and recall components" class="center" /></a>
<span class="caption text-muted">Precision and recall components<br />Source: <a href="https://en.wikipedia.org/wiki/Precision_and_recall">wikipedia.org</a></span>

<ul><li>
<p><strong><a href="https://en.wikipedia.org/wiki/F-score">F<sub>1</sub>-score</a></strong>: balance between precision and recall</p>
</li></ul>
<a href="/img/ml-training/f1_calculation.png"><img src="/img/ml-training/f1_calculation.png" alt="F1 calculation" class="center-large" /></a>
<ul><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Receiver_operating_characteristic">ROC curve</a></strong>: plot of model performance for all classification thresholds</p>
</li><li>
<p><strong><a href="https://en.wikipedia.org/wiki/Receiver_operating_characteristic#Area_under_the_curve">AUC</a></strong>: Area under the ROC curve, provides an aggregate measure between 0 and 1 of performance across all possible classification thresholds</p>
</li></ul>

<a href="/img/ml-training/roc_curve.png"><img src="/img/ml-training/roc_curve.png" alt="TP vs FP rate at different classification thresholds" class="center" /></a>
<span class="caption text-muted">TP vs FP rate at different classification thresholds<br />Source: <a href="https://developers.google.com/machine-learning/crash-course/classification/roc-and-auc">developers.google.com</a></span>

<h2>Further Considerations</h2>

<p>There are many further important considerations when training a good machine learning model. I plan to cover these in a future post. For now I’ll list</p>

<ul><li>
<p><a href="https://en.wikipedia.org/wiki/Imputation_(statistics)">Imputation</a> of <a href="https://en.wikipedia.org/wiki/Missing_data">missing values</a></p>
</li><li>
<p>Handling imbalanced datasets with <a href="https://en.wikipedia.org/wiki/Oversampling_and_undersampling_in_data_analysis">over &amp; under sampling</a></p>
</li><li>
<p>Choosing a good <a href="https://en.wikipedia.org/wiki/Loss_function#Selecting_a_loss_function">objective function to optimise</a></p>
</li><li>
<p><a href="https://en.wikipedia.org/wiki/Feature_engineering">Feature engineering</a> and <a href="https://en.wikipedia.org/wiki/Feature_selection">feature selection</a></p>
</li><li>
<p><a href="https://en.wikipedia.org/wiki/Normalization_(statistics)">Normalisation</a>/standardisation of features</p>
</li><li>
<p>Prevent <a href="https://en.wikipedia.org/wiki/Leakage_(machine_learning)">information leakage</a> from training to test sets (especially with time series data)</p>
</li><li>
<p>Model interpretation &amp; <a href="https://en.wikipedia.org/wiki/Explainable_artificial_intelligence">explainability</a></p>
</li><li>
<p>Data and <a href="https://en.wikipedia.org/wiki/Concept_drift">model/concept drift</a> over time</p>
</li><li>
<p>Model <a href="https://en.wikipedia.org/wiki/AI_accelerator">performance</a> at training (and inference) time</p>
</li><li>
<p>Ease of trained model productionisation, <a href="https://en.wikipedia.org/wiki/MLOps">MLOps</a> and <a href="https://en.wikipedia.org/wiki/ModelOps">ModelOps</a></p>
</li></ul>

<h2>Further Resources</h2>

<p>These are my recommended machine and deep learning lecture videos, all available via Youtube:</p>

<ul><li>
<p><a href="https://www.youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU">Stanford CS229: Machine Learning with Andrew Ng, 2018</a> (<a href="https://stanford.edu/~shervine/teaching/cs-229/">online notes</a>)</p>
</li><li>
<p><a href="https://www.youtube.com/playlist?list=PLoROMvodv4rOABXSygHTsbvUz4G_YQhOb">Stanford CS230: Deep Learning with Andrew Ng, 2018</a> (<a href="https://stanford.edu/~shervine/teaching/cs-230/">online notes</a>)</p>
</li><li>
<p><a href="https://www.youtube.com/playlist?list=PLkt2uSq6rBVctENoVBg1TpCC7OQi31AlC">CS231n: DL for Computer Vision with Andrej Karpathy, 2016</a> (<a href="https://aman.ai/cs231n/">online notes</a>)</p>
</li><li>
<p><a href="https://www.youtube.com/playlist?list=PLtBw6njQRU-rwp5__7C0oIVt26ZgjG9NI">MIT 6.S191 Intro to DL Home with Alexander Amini, 2022</a> (<a href="https://github.com/aamini/introtodeeplearning/">github repo</a>)</p>
</li><li>
<p><a href="https://www.youtube.com/playlist?list=PLTKMiZHVd_2KyGirGEvKlniaWeLOHhUF3">UW-Madison STAT 451 Introduction to ML with Sebastian Raschka, 2021</a> (<a href="https://github.com/rasbt/stat451-machine-learning-fs20">github repo</a>)</p>
</li></ul>

<p>Google also has a good <a href="https://developers.google.com/machine-learning/foundational-courses">foundational</a> and <a href="https://developers.google.com/machine-learning/advanced-courses">advanced</a> ML courses.</p>

<p>Additionally, here are some amazing machine learning notes by Christopher Olah that everyone should checkout: <a href="http://colah.github.io/">colah.github.io</a></p>
