---
layout:     post
title:      "Machine Learning Productionisation"
subtitle:   "How to bring your ML model to life for your users"
date:       2022-01-19 09:00:00
tags:       [Machine Learning, Productionisation, MLOps]
author:     "Dylan Hogg"
header-img: "img/post-bg-04.jpg"
published:  false
comments:   true
---

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">What is machine learning productionisation?</h2>

Machine learning productionisation can mean different things. It could mean taking a pre-trained ML model and making it available as an API. Or it could involve building a pipeline for data preparation, model training, optimisation and validation. There may even be an application or dashboard so that a user can interact with the model. 

Hopefully you are also monitoring your productionised system to ensure everything is running as required, for example catching unexpected errors or measuring model drift on new data over time. If you're able to reproduce experimental results, iterate quickly and push to production reliably then you get bonus points.

Regardless of the precise definition, getting machine learning models into a production system and maintaining them over time is hard.

Best practices are emerging to ensure you can sucessfully train, validate, operationalise and monitor your model. 

This post is a 10,000-foot overview of things to consider during the life-cycle of a machine learning project and includes pointers to useful resources. 


<h2 class="section-heading">Contents</h2>
Sections Original:

* What is machine learning productionisation?
* Production software requirements
* Production ML System Requirements
* Machine Learning Canvas
* Google's Rules of Machine Learning
* Technical debt in Machine Learning systems
* Automated Machine Learning pipelines - basic to advanced
* TODO: Online / Streaming / Realtime ML
* TODO: Proof of Concept to Production
* TODO: Model deployment
* TODO: Model serving, monitoring and maintenance
* 3rd Party Machine Learning frameworks


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Production software requirements</h2>

As a baseline, a robust production ML system should adhere to good software engineering practices. These foundations must be solid to successfully deploy and operationalise ML models, which come with additional challenges. 

Baseline examples:
* Instrumentation, logging and error alerting
* Ability to monitor running systems for required metrics
* The system scales to expected load
* Code is source controlled (really I have to mention this?)
* Continuous integration/continuous deployment (CI/CD) pipelines
* External (non-hardcoded) configuration
* Following company coding best practices
* Unit tests to enable confident refactoring
* Integration tests to catch bugs early

Atlassian has a series of <a href="https://www.atlassian.com/software-development">articles on software best practices</a> that you may find useful

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Production ML System Requirements</h2>

Due to the nature of ML systems and their reliance on training data to produce a model, they have additional requirements over and above traditional software systems.

Data is as important to ML developers as code is to traditional software developers, and many of the same issues affecting code affect data as well, for example versioning.

Highly desirable ML system requirements:

* Reproducable model training and validation
* Data lineage for data prep, issue tracing and auditability
* Model versioning with metadata
* Protection from data leakage when training
* Correspondence between training data features and operationalised model data features
* Ability to roll back to previous model (and the corresponding input data features) 
* Scalable model prediction serving to meet expected load
* Automated deployment for your use case (e.g. real time/batch predictions)

Desirable ML system requirements:
* Initial requirements scoping (e.g. via <a href="https://www.ownml.co/machine-learning-canvas">Machine Learning Canvas</a>) 
* Ability to track multiple training experiments with different data features and hyperparameters 
* Scalable model training for expected data size and compute requirements
* Clear tracking of how features were generated
* Automated confidence intervals for data quality (input) and predictions (output) 
* Automated model re-training and validation
* Feature store for data reuse and reproducability
* Ability to track model drift over time (e.g. continuous validation after deployment)


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Machine Learning Canvas</h2>

It's worth remembering that not all models need to be productionised. Before going down this path hopefully you've determined that the value from productionising a model is greater that the cost of productionising and the associated ongoing system maintenance.

The <a href="https://www.ownml.co/machine-learning-canvas">Machine Learning Canvas</a> (adapted from the popular <a href="https://leanstack.com/lean-canvas">Lean Canvas</a>) identifies requirements, problems and scope of an ML model and is useful to get all parties on the same page early in an ML project.

It helps describe how your ML system will turn predictions into value for end-users, which data it will learn from, and how to make sure it will work as intended. It also helps anticipate costs, identify bottlenecks, specify requirements, and create a roadmap.

<a href="/img/ml-productionisation/ml-canvas-sample.png"><img src="/img/ml-productionisation/ml-canvas-sample.png" alt="Machine Learning Canvas sample" /></a>
<span class="caption text-muted">Source: <a href="https://www.ownml.co/machine-learning-canvas">www.ownml.co/machine-learning-canvas</a></span>


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Google's Rules of Machine Learning</h2>

Google has published their machine learning best practices (<a href="https://developers.google.com/machine-learning/guides/rules-of-ml/">Rules of Machine Learning</a>) with tonnes of wisdom.

These 4 points are recommended when starting to productionise ML:

1. Make sure your pipeline is solid end to end
2. Start with a reasonable objective
3. Add common--sense features in a simple way
4. Make sure that your pipeline stays solid

And they come with this wise caveat: "This approach will work well for a long period of time. Diverge from this approach only when there are no more simple tricks to get you any farther. Adding complexity slows future releases."

There are 43 rules and here are some highlights:

* Rule #4: Keep the first model simple and get the infrastructure right
* Rule #5: Test the infrastructure independently from the machine learning
* Rule #8: Know the freshness requirements of your system
* Rule #9: Detect problems before exporting models
* Rule #11: Give feature columns owners and documentation
* Rule #14: Starting with an interpretable model makes debugging easier
* Rule #16: Plan to launch and iterate
* Rule #29: The best way to ensure that you train like you serve: save the set of features at serving time and pipe them to a log to training with later 
* Rule #31: Beware that if you join data from a table at training and serving time, the data in the table may change
* Rule #32: Re-use code between your training pipeline and your serving pipeline whenever possible


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Technical debt in Machine Learning systems</h2>

Know what you're getting into. If you are new on this journey, the Google paper <a href="http://papers.neurips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf">Hidden Technical Debt in Machine Learning Systems</a> is a must-read. 

Here's the gist:

"In this paper, we argue that ML systems have a special capacity for incurring technical debt, because they have all of the maintenance problems of traditional code plus an additional set of ML-specific issues. This debt may be difficult to detect because it exists at the system level rather than the code level. Traditional abstractions and boundaries may be subtly corrupted or invalidated by the fact that data influences ML system behavior. Typical methods for paying down code level technical debt are not sufficient to address ML-specific technical debt at the system level."

"Code dependencies can be identified via static analysis by compilers and linkers. Without similar tooling for data dependencies, it can be inappropriately easy to build large data dependency chains that can be difficult to untangle."

Finally, a popular visualisation from the paper of real-world ML systems:

<a href="/img/ml-productionisation/hidden_tech_debt.png"><img src="/img/ml-productionisation/hidden_tech_debt.png" alt="Hidden tech debt" /></a>
<span class="caption text-muted">Source: <a href="http://papers.neurips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf">Hidden Technical Debt in Machine Learning Systems (Sculley et al.)</a></span>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading">Automated Machine Learning pipelines - basic to advanced</h2>

There are several steps in a full ML pipeline, some steps can be manual, others automated.

A productionised predictive ML model is one piece with a fair bit going on, and the best place to start.

Further down the track data quality, data splits, feature engineering, model optimisation and training comprise other pieces.

<h3 class="section-heading">1. Prediction only ML pipeline</h3>

The first step is to productionise the trained model to make automated predictions on unlabeled data.

![](/img/ml-productionisation/pipeline1.png "Pipeline 1")
<span class="caption text-muted">Source: Dylan Hogg</span>

<h3 class="section-heading">2. Basic ML pipeline with training and testing</h3>

An extension is to automate the data splits, model training and performance evaluation. Helps with reproducibility and saving time.

![](/img/ml-productionisation/pipeline2.png "Pipeline 2")
<span class="caption text-muted">Source: Dylan Hogg</span>

<h3 class="section-heading">3. Full pipeline with multiple trained models, evaluation, selection and testing</h3>

The next (possible) step is to automate training and evaluation of multiple models with multiple training input data feature sets.

![](/img/ml-productionisation/pipeline3.png "Pipeline 3")
<span class="caption text-muted">Source: Dylan Hogg</span>


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
<h2 class="section-heading">TODO: TEMP: Potential references</h2>

Productionisation
- https://blog.streamlit.io/how-to-master-streamlit-for-data-science/amp/  !!

Awesome lists:
- https://project-awesome.org/igorbarinov/awesome-data-engineering
- https://github.com/eugeneyan/applied-ml

Interpretable:
- https://christophm.github.io/interpretable-ml-book/

Training and experiments:
https://valohai.com/mlops-platforms-compared/

- MLFlow (Databricks): An open source platform for the machine learning lifecycle
  - Experiment tracking focussed. A Python program for tracking experiments and versioning models.
  - https://mlflow.org/
  - https://github.com/mlflow/mlflow
- KubeFlow (Google): The Machine Learning Toolkit for Kubernetes
  - Pipeline focussed. At its core, a container orchestration system
  - https://www.kubeflow.org/
  - https://github.com/kubeflow/kubeflow
  - https://valohai.com/blog/kubeflow-vs-mlflow/
- Weights & Biases: Build better models faster with experiment tracking, dataset versioning, and model management
  - https://wandb.ai/site
  - https://github.com/wandb/client
- Metaflow (Netflix): Build and manage real-life data science projects with ease
  - https://metaflow.org/
  - https://github.com/Netflix/metaflow
- Neptune: Manage all your model building metadata in a single place
  - https://neptune.ai/
  - https://github.com/neptune-ai/neptune-client
- Comet: Manage and optimize the entire ML lifecycle, from experiment tracking to model production monitoring.
  - https://www.comet.ml/site/
  - https://github.com/comet-ml
- Valohai (commercial?): Train, Evaluate, Deploy, Repeat. Valohai is the only MLOps platform that automates everything from data extraction to model deployment.
  - https://valohai.com/
  - https://github.com/valohai/valohai-cli
- SageMaker
- Databricks



Proof of Concept to Production:
- X 

People:
- https://eugeneyan.com/
  - https://applyingml.com/
- https://huyenchip.com
  - https://huyenchip.com/2022/01/02/real-time-machine-learning-challenges-and-solutions.html
  - https://www.youtube.com/watch?v=t9cwk3zB7N0 (ML Production Myths)
- Andrew Ng
  - https://www.andrewng.org/
  - https://read.deeplearning.ai/the-batch/tag/letters/
  - 

Courses:
- https://www.coursera.org/learn/machine-learning
- https://www.deeplearning.ai/program/machine-learning-engineering-for-production-mlops/
- https://stanford-cs329s.github.io/syllabus.html ?
- https://fullstackdeeplearning.com/ ? (2019 version more engineering focussed)

Industry info:
- https://d1.awsstatic.com/whitepapers/accenture-industrializes-machine-learning-workloads-on-aws.pdf

Books:
- https://blog.floydhub.com/best-machine-learning-books/
- https://leanpub.com/MLE
- Deep Learning With Python (Chollet, 2021)
- 

Frameworks:
- PyTorch
  - https://pytorch.org/tutorials/intermediate/flask_rest_api_tutorial.html
  - https://pytorch.org/tutorials/intermediate/tensorboard_profiler_tutorial.html
  - https://github.com/pytorch/serve

Career:
- https://read.deeplearning.ai/the-batch/building-your-ai-career-a-report-by-workera/


Feast: https://cloud.google.com/blog/products/ai-machine-learning/introducing-feast-an-open-source-feature-store-for-machine-learning