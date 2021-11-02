---
layout:     post
title:      "Machine Learning Productionisation"
subtitle:   "How to bring your ML model to life for your users"
date:       2021-10-01 09:00:00
tags:       [Machine Learning, Productionisation, MLOps]
author:     "Dylan Hogg"
header-img: "img/post-bg-04.jpg"
published:  false
comments:   true
---

<p style="color:red">BLOGPOST IN PROGRESS</p>

TODO: investigate https://excalidraw.com/ for diagrams...


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">ML Productionisation</h2>

This blog post covers several different aspects of productionising ML systems including software requirements, ML specific requirements, scoping via the ML canvas, Google's rules of ML, technical debt in ML systems, pipelines and finally 3rd party frameworks.

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Requirements for production software systems</h2>

A robust production ML system should include good general software practices.

Must haves
* Instrumentation, logging and error alerting
* Ability to monitoring running system
* System scales to expected load
* Code is source controlled
* Integration with CI/CD pipelines External (non-hardcoded) configuration

Nice to have
* Follow any company practices
* Integration tests for developer debugging 
* Unit tests to enable confident refactoring


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Requirements for production Machine Learning systems</h2>

Due to the nature of ML systems and their reliance on training data to produce a model, they have additional requirements over and above traditional software systems.

Data is as important to ML developers as code is to traditional software developers, and many of the same issues affecting code affect data as well, for example versioning.

Must haves
* Training / Prediction model reproducibility
* Data lineage for error tracing and auditability
* Model versioning and metadata
* Ability to rollback to previous model (and the corresponding input data features) 
* Scalable model prediction serving for expected load
* Automated deployment for use case (e.g. real time/batch predictions) 
* Protection from data leakage when training

Nice to have
* Initial requirements scoping via the ML Canvas: https://www.louisdorard.com/machine-learning-canvas 
* Ability to track multiple training experiments with different data features and hyper-parameters 
* Scalable model training for expected data size
* Clear tracking of how features were generated (related to data lineage)
* Automatic confidence intervals for data quality (input) and predictions (output) 
* Automated model re-training and validation
* Ability to track model drift over time (e.g. continuous cross validation after deployment)


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Machine Learning Canvas</h2>

The ML Canvas (adapted from Lean Canvas) identifies requirements, problems and scope of an ML model and is useful to get all parties on the same page early in an ML project.

Its focus is on the goal, learning, evaluation and prediction stages of ML development.
https://www.ownml.co/machine-learning-canvas

TODO: img

TODO: also https://www.ownml.co/checklist

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Rules of Machine Learning</h2>

Google has published their best practices for ML with tonnes of wisdom: https://developers.google.com/machine-learning/guides/rules-of-ml/
(Note that pipeline here refers to a generic data pipeline, not a BuildKite pipeline.)
These 4 points are recommended when starting to productionise ML and comes with this wise caveat:

"This approach will work well for a long period of time. Diverge from this approach only when there are no more simple tricks to get you any farther. Adding complexity slows future releases."

1. Make sure your pipeline is solid end to end
2. Start with a reasonable objective
3. Add common--sense features in a simple way 4. Make sure that your pipeline stays solid

There are 40-odd rules from basic to advanced, here are some highlights:

* Rule #4: Keep the first model simple and get the infrastructure right
* Rule #5: Test the infrastructure independently from the machine learning
* Rule #8: Know the freshness requirements of your system
* Rule #9: Detect problems before exporting models
* Rule #11: Give feature columns owners and documentation
* Rule #14: Starting with an interpretable model makes debugging easier
* Rule #16: Plan to launch and iterate
* Rule #29: The best way to ensure that you train like you serve: save the set of features at serving time and pipe them to a log to training with later Rule #31: Beware that if you join data from a table at training and serving time, the data in the table may change
* Rule #32: Re-use code between your training pipeline and your serving pipeline whenever possible

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Technical debt in Machine Learning systems</h2>

This is a recommended paper on tech debt in ML systems: https://papers.nips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf

Here's the gist:

"In this paper, we argue that ML systems have a special capacity for incurring technical debt, because they have all of the maintenance problems of traditional code plus an additional set of ML-specific issues. This debt may be difficult to detect because it exists at the system level rather than the code level. Traditional abstractions and boundaries may be subtly corrupted or invalidated by the fact that data influences ML system behavior. Typical methods for paying down code level technical debt are not sufficient to address ML-specific technical debt at the system level."

"Code dependencies can be identified via static analysis by compilers and linkers. Without similar tooling for data dependencies, it can be inappropriately easy to build large data dependency chains that can be difficult to untangle."

Finally, a popular visualisation of real-world ML systems:

TODO: img

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Automated Machine Learning pipelines - basic to advanced</h2>

There are several steps in a full ML pipeline, some steps can be manual, others automated.

A productionised predictive ML model is one piece with a fair bit going on, and the best place to start.

Further down the track data quality, data splits, feature engineering, model optimisation and training comprise other pieces.

<h3 class="section-heading">1. Prediction only ML pipeline</h3>

The first step is to productionise the trained model to make automated predictions on unlabeled data.

TODO: img

<h3 class="section-heading">2. Basic ML pipeline with training and testing</h3>

An extension is to automate the data splits, model training and performance evaluation. Helps with reproducibility and saving time.

TODO: img

<h3 class="section-heading">3. Full pipeline with multiple trained models, evaluation, selection and testing</h3>

The next (possible) step is to automate training and evaluation of multiple models with multiple training input data feature sets.

TODO: img

(Pipeline image references: http://www.ebc.cat/2017/01/23/predicting-with-labeled-data/)

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">3rd Party Machine Learning frameworks</h2>

Here are some frameworks by other companies/organisations. Mainly as a place to collect them for evaluation.

AWS SageMaker
* https://aws.amazon.com/sagemaker/ SageMaker customers
* AWS internal use case
* Intuit case study

Uber
* https://eng.uber.com/michelangelo/ 
* https://eng.uber.com/scaling-michelangelo/
* https://eng.uber.com/michelangelo-pyml/

Airbnb
* https://databricks.com/session/bighead-airbnbs-end-to-end-machine-learning-platform
* https://github.com/airbnb/aerosolve

Stripe
* https://stripe.com/au/blog/railyard-training-models

Facebook
* https://code.fb.com/core-data/introducing-fblearner-flow-facebook-s-ai-backbone/

Salesforce
* https://github.com/salesforce/TransmogrifAI

Other
* https://www.kubeflow.org/ - ML Toolkit for Kubernetes
* https://www.mlflow.org/ - Open source platform for the machine learning lifecycle https://github.com/apache/predictionio - Open source ML framework 
* https://polyaxon.com/ - Platform for ML applications


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Recommended ML books</h2>

* Hands-On Machine Learning with Scikit-Learn and TensorFlow 
* An Introduction to Statistical Learning: with Applications in R
* Pattern Recognition and Machine Learning


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">References</h2>

http://martin.zinkevich.org/rules_of_ml/rules_of_ml.pdf

https://developers.google.com/machine-learning/guides/rules-of-ml/

https://papers.nips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf

https://developers.google.com/machine-learning/crash-course/production-ml-systems

https://www.louisdorard.com/machine-learning-canvas

https://www.oreilly.com/ideas/what-are-model-governance-and-model-operations


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">TODO: Potential references</h2>

https://christophm.github.io/interpretable-ml-book/

https://github.com/eugeneyan/applied-ml

https://applyingml.com/

https://www.youtube.com/watch?v=t9cwk3zB7N0

https://stanford-cs329s.github.io/syllabus.html ?

https://fullstackdeeplearning.com/ ? (2019 version more engineering focussed)


