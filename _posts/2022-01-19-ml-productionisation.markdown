---
layout:     post
title:      "Machine Learning Productionisation"
subtitle:   "How to bring your ML model to life for your users"
date:       2022-01-19 09:00:00
tags:       [Machine Learning, Productionisation, Software Engineering, ML Engineering, MLOps, DataOps, Data]
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

This is Part 3 in the machine learning series, covering productionisation of models. Part 1 covers <a href="https://blog.infocruncher.com/2023/02/15/ml-overview/">an overview of machine learning</a> and common algorithms, while Part 2 covers <a href="https://blog.infocruncher.com/2023/02/17/ml-training/">model training and learning from data</a>.  

<h2 class="section-heading" id="wimlp">What is machine learning productionisation?</h2>

Machine learning productionisation can mean different things. It could mean taking a pre-trained ML model and making it available as an API. It could also involve building a pipeline for data preparation, model training, optimisation, and validation.

Hopefully you are also monitoring your productionised system to ensure everything is running well, for example catching unexpected errors or measuring model drift on new data over time. If you're able to reproduce experimental results, iterate quickly and push to production automatically then you get bonus points.

Regardless of the precise definition, getting machine learning models into a production system and maintaining them over time is hard.

<a href="/img/ml-productionisation/xkcd_machine_learning_2x.png"><img src="/img/ml-productionisation/xkcd_machine_learning.png" alt="xkcd comic of machine learning" class="center" /></a>
<span class="caption text-muted">Source: <a href="https://xkcd.com/1838/">xkcd.com</a></span>

Best practices are emerging to ensure you can successfully prepare data, train a model, validate predictions, deploy, serve and monitor your model.

This post is a 10,000-foot overview of things to consider during the life cycle of a machine learning project and includes pointers to useful resources. 

<h2 class="section-heading">What's covered here?</h2>

<p>
1) <a href="#psr">Production software requirements</a><br />  
2) <a href="#pmlsr">Production ML System Requirements</a><br />  
3) <a href="#canvas">Machine Learning Canvas</a><br />  
4) <a href="#rules">Google's Rules of Machine Learning</a><br />  
5) <a href="#techdebt">Technical debt in Machine Learning systems</a><br />  
6) <a href="#pipelines">Automated Machine Learning pipelines - basic to advanced</a><br />  
7) <a href="#frameworks">Machine Learning frameworks</a><br />  
8) <a href="#final">Final thoughts</a><br />  
</p>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="psr">Production software requirements</h2>

As a baseline, a robust production ML system should adhere to good software engineering practices. These foundations must be solid to successfully deploy and operationalise ML models, which come with additional challenges. 

Baseline examples:
* Instrumentation, logging and error alerting
* Ability to monitor running systems for required metrics
* The system scales to expected load
* Code is source controlled
* Continuous integration/continuous deployment (CI/CD) pipelines
* External (non-hardcoded) configuration
* Following company coding best practices
* Unit tests to enable confident refactoring
* Integration tests to catch bugs early

Atlassian has a series of <a href="https://www.atlassian.com/software-development">articles on software best practices</a> that you may find useful.

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="pmlsr">Production ML System Requirements</h2>

ML systems have additional requirements over and above traditional software systems due to their reliance on training data to construct a model

Data is as important to ML systems as code is to traditional software. Also, many of the same issues affecting code affect data as well, for example versioning.

A comparison of traditional programming vs ML is shown in this diagram. It highlights the shift in thinking required for constructing models and learning rules from data.

<a href="/img/ml-productionisation/programming_vs_ml.jpeg"><img src="/img/ml-productionisation/programming_vs_ml.jpeg" alt="programming vs ML" class="center" /></a>
<span class="caption text-muted">Classical programming contrasted with machine learning<br />Source: <a href="https://twitter.com/kpaxs/status/1163058544402411520">twitter.com/kpaxs</a></span>

There are several emerging fields growing to address the ML system life cycle.

1) Data Engineering - designing and building systems for collecting, storing, processing and analysing data at scale.  
2) ML Engineering - intersection of machine learning and software engineering; bringing solid engineering principals to building ML models.  
3) <a href="https://en.wikipedia.org/wiki/MLOps">MLOps</a> - intersection of machine learning, data engineering and <a href="https://en.wikipedia.org/wiki/DevOps">DevOps</a>; deployment, health, diagnostics and governance of production ML models.  
4) <a href="https://en.wikipedia.org/wiki/DataOps">DataOps</a> - manages the entire data lifecycle from source to value.  
5) <a href="https://en.wikipedia.org/wiki/ModelOps">ModelOps</a> or AIOps - extends MLOps and manages all model lifecycles across a company ensuring technical, business and compliance KPI's.  

<a href="/img/ml-productionisation/wiki_mlops.png"><img src="/img/ml-productionisation/wiki_mlops.png" alt="MLOps intersection venn diagram" class="center" /></a>
<span class="caption text-muted">Source: <a href="https://en.wikipedia.org/wiki/MLOps">Wikipedia</a></span>

These fields are still being defined and created and some may disappear in time. What these descriptions highlight is the interdisciplinary nature required to successfully productionise ML models. 

Highly desirable ML system requirements:

* Reproducible model training and validation
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
* Feature store for data reuse and reproducibility
* Ability to track model drift over time (e.g. continuous validation after deployment)

<i>Update Nov 2022:</i><br />
<a href="https://arxiv.org/abs/2209.09125">Operationalizing Machine Learning: An Interview Study</a> from University of California, Berkeley is a great read. It covers interviews with 18 MLEs working across many applications and summarises common practices for successful ML experimentation, deployment, sustaining production performance, pain points and anti-patterns.


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="canvas">Machine Learning Canvas</h2>

It's worth remembering that not all models need to be productionised. Before going down this path hopefully you've determined that the value from productionising a model is greater than the cost of productionising and the associated ongoing system maintenance.

The <a href="https://www.ownml.co/machine-learning-canvas">Machine Learning Canvas</a> (adapted from the popular <a href="https://leanstack.com/lean-canvas">Lean Canvas</a>) identifies requirements, problems and scope of an ML model and is useful to get all parties on the same page early in an ML project.

It helps describe how your ML system will turn predictions into value for end-users, which data it will learn from, and how to make sure it will work as intended. It also helps anticipate costs, identify bottlenecks, specify requirements, and create a roadmap.

<a href="/img/ml-productionisation/ml-canvas-sample.png"><img src="/img/ml-productionisation/ml-canvas-sample.png" alt="Machine Learning Canvas sample" /></a>
<span class="caption text-muted">Source: <a href="https://www.ownml.co/machine-learning-canvas">www.ownml.co/machine-learning-canvas</a></span>


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="rules">Google's Rules of Machine Learning</h2>

Google has published their machine learning best practices (<a href="https://developers.google.com/machine-learning/guides/rules-of-ml/">Rules of Machine Learning</a>) and has deep wisdom.

These 4 points are recommended when starting to productionise ML:

1. Make sure your pipeline is solid end to end
2. Start with a reasonable objective
3. Add common--sense features in a simple way
4. Make sure that your pipeline stays solid

Followed by this wise caveat: "This approach will work well for a long period of time. Diverge from this approach only when there are no more simple tricks to get you any farther. Adding complexity slows future releases."

There are 43 rules in total. Here are some highlights:

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
<h2 class="section-heading" id="techdebt">Technical debt in Machine Learning systems</h2>

It's helpful to know what you're getting into. If you are new on this journey, the paper <a href="http://papers.neurips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf">Hidden Technical Debt in Machine Learning Systems</a> is a must-read. 

Here's the gist:

"ML systems have a special capacity for incurring technical debt, because they have all of the maintenance problems of traditional code plus an additional set of ML-specific issues. This debt may be difficult to detect because it exists at the system level rather than the code level. Traditional abstractions and boundaries may be subtly corrupted or invalidated by the fact that data influences ML system behaviour. Typical methods for paying down code level technical debt are not sufficient to address ML-specific technical debt at the system level."

"Code dependencies can be identified via static analysis by compilers and linkers. Without similar tooling for data dependencies, it can be inappropriately easy to build large data dependency chains that can be difficult to untangle."

This image summarises the paper very well and puts the core ML code into perspective when productionising: 

<a href="/img/ml-productionisation/hidden_tech_debt.png"><img src="/img/ml-productionisation/hidden_tech_debt.png" alt="Hidden tech debt" /></a>
<span class="caption text-muted">Source: <a href="http://papers.neurips.cc/paper/5656-hidden-technical-debt-in-machine-learning-systems.pdf">Hidden Technical Debt in Machine Learning Systems (Sculley et al.)</a></span>

<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="pipelines">Automated Machine Learning pipelines - basic to advanced</h2>

There are several steps in a full ML pipeline. Some steps may be manual at first, especially when proving value to the business. 

The key is to understand that the manual steps should be automated in time rather than continuing to accumulate tech debt and potentially produce error-prone results. It is best to understand this commitment at the start.

A productionised predictive ML model is one piece with a fair bit going on, and the best place to start.

Further down the track data quality, data splits, feature engineering, model optimisation and training comprise other pieces.

<h3>1. Prediction only ML pipeline</h3>

The first step is to productionise the trained model to make automated predictions on unlabelled data.

This diagram only shows the input data and output prediction flow - it doesn't address where the data comes from or how the predictions are used.

<a href="/img/ml-productionisation/pipeline1.png"><img src="/img/ml-productionisation/pipeline1.png" alt="Prediction only ML pipeline" /></a>
<span class="caption text-muted">Prediction only ML pipeline<br />Source: Author</span>

<h3>2. Basic ML pipeline with training and testing</h3>

An extension is to automate the data splits, model training and performance evaluation. This helps with reproducibility, removes error-prone manual steps, and saves time.

<a href="/img/ml-productionisation/pipeline2.png"><img src="/img/ml-productionisation/pipeline2.png" alt="Basic ML pipeline with training and testing" /></a>
<span class="caption text-muted">Basic ML pipeline with training and testing<br />Source: Author</span>

<h3>3. Pipeline with multiple trained models, evaluation, selection and testing</h3>

A next possible step is to automate training and evaluation of multiple models with multiple training input data feature sets.

This gets complex very quickly and requires pre-requisite systems to be in place to run efficiently. The emerging field of MLOps (machine learning operations) is building tools, techniques and companies to handle these type of scenarios. 

<a href="/img/ml-productionisation/pipeline3.png"><img src="/img/ml-productionisation/pipeline3.png" alt="Pipeline with multiple trained models, evaluation, selection and testing" /></a>
<span class="caption text-muted">Pipeline with multiple trained models, evaluation, selection and testing<br />Source: Author</span>

<h3>4. Deploying and monitoring</h3>

What isn't addressed in the pipeline diagrams above is model deployment, serving and monitoring. 

This is dependent on many things: your current infrastructure, who will be consuming the model results, performance requirements, size of data etc.

For example, if you have a <a href="https://kubernetes.io/">Kubernetes</a> cluster available, you could containerise your model and deploy using <a href="https://www.kubeflow.org/">Kubeflow</a>. 
Or maybe your company uses AWS and your model is small? In this case you could use existing deployment practices and deploy to <a href="https://aws.amazon.com/lambda/">Lambda</a> or else utilise the managed AWS <a href="https://aws.amazon.com/sagemaker/mlops/">SageMaker</a> service. 
If you're just starting out, you may be able to set up a Python webserver and utilise a framework like <a href="https://fastapi.tiangolo.com/">FastAPI</a> to serve model results.

Whichever path you choose, follow the software and ML system best practices described above where possible.


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="frameworks">Machine Learning frameworks</h2>

To round off this post, here are a some open-source and commercial offerings that you could check out.

<h3>Machine Learning Frameworks</h3>

It is best to build on the shoulders of giants. Here are some open-source ML frameworks you might find want to explore in your ML productionisation journey:  

- MLFlow (Databricks): An open-source platform for the machine learning lifecycle, experiment tracking focussed.  
  - <a href="https://mlflow.org/">mlflow.org</a>
  - <a href="https://github.com/mlflow/mlflow">github.com/mlflow/mlflow</a>
- KubeFlow (Google): The Machine Learning Toolkit for Kubernetes. Pipeline focussed. At its core, a container orchestration system
  - <a href="https://www.kubeflow.org/">www.kubeflow.org</a>
  - <a href="https://github.com/kubeflow/kubeflow">github.com/kubeflow/kubeflow</a>
  - <a href="https://valohai.com/blog/kubeflow-vs-mlflow/">valohai.com/blog/kubeflow-vs-mlflow</a>
- Weights & Biases: Build better models faster with experiment tracking, dataset versioning, and model management
  - <a href="https://wandb.ai/site">wandb.ai/site</a>
  - <a href="https://github.com/wandb/client">github.com/wandb/client</a>
- Metaflow (Netflix): Build and manage real-life data science projects with ease
  - <a href="https://metaflow.org/">metaflow.org</a>
  - <a href="https://github.com/Netflix/metaflow">github.com/Netflix/metaflow</a>
- Neptune: Manage all your model building metadata in a single place
  - <a href="https://neptune.ai/">neptune.ai</a>
  - <a href="https://neptune.ai/">github.com/neptune-ai/neptune-client</a>
- Comet: Manage and optimize the entire ML lifecycle, from experiment tracking to model production monitoring.
  - <a href="https://www.comet.ml/site/">www.comet.ml/site</a>
  - <a href="https://github.com/comet-ml">github.com/comet-ml</a>
- Ludwig: Data-centric declarative deep learning framework
  - <a href="http://ludwig.ai/">http://ludwig.ai</a>
  - <a href="https://github.com/ludwig-ai/ludwig">github.com/ludwig-ai/ludwig</a>
- Kedro: A framework for creating reproducible, maintainable and modular data science code.
  - <a href="https://kedro.readthedocs.io/">kedro.readthedocs.io</a>
  - <a href="https://github.com/kedro-org/kedro">github.com/kedro-org/kedro</a>
- Dagster: An orchestration platform for the development, production, and observation of data assets.
  - <a href="https://dagster.io/">dagster.io</a>
  - <a href="https://github.com/dagster-io/dagster">github.com/dagster-io/dagster</a>
- ClearML (commercial): CI/CD to streamline your ML workflow. Experiment Manager, MLOps and Data-Management.
  - <a href="https://clear.ml/docs">clear.ml/docs</a>
  - <a href="https://github.com/allegroai/clearml">github.com/allegroai/clearml</a>
- Valohai (commercial): Train, Evaluate, Deploy, Repeat. Valohai is the only MLOps platform that automates everything from data extraction to model deployment.
  - <a href="https://valohai.com/">valohai.com</a>
  - <a href="https://github.com/valohai/valohai-cli">github.com/valohai/valohai-cli</a>
- Feast: An open-source feature store. It is the fastest path to operationalizing analytic data for model training and online inference.
  - <a href="https://feast.dev/">feast.dev</a>
  - <a href="https://github.com/feast-dev/feast">github.com/feast-dev/feast</a>
- Pachyderm: Automate data transformations with data versioning and lineage.
  - <a href="https://www.pachyderm.com/">pachyderm.com</a>
  - <a href="https://github.com/pachyderm/pachyderm">github.com/pachyderm/pachyderm</a>


<h3>Managed Cloud ML Services</h3>

The big cloud players are in MLOps now too.  

- <a href="https://aws.amazon.com/sagemaker/mlops/">AWS SageMaker</a> - Build, train, deploy, and manage ML models 
- <a href="https://cloud.google.com/vertex-ai">Google Vertex AI</a> - Build, deploy, and scale ML models
- <a href="https://azure.microsoft.com/en-au/services/machine-learning/mlops/">Azure MLOps</a>  - Automate and accelerate the machine learning lifecycle
- <a href="https://databricks.com/product/machine-learning">Databricks ML</a> - Data-native and collaborative ML solution for the full ML lifecycle
- <a href="https://www.datarobot.com/platform/mlops/">DataRobot</a> - Center of Excellence for Machine Learning Operations and Production AI
- <a href="https://www.dataiku.com/product/key-capabilities/mlops/">Dataiku</a> - Deploy, monitor, and manage machine learning projects in production
- <a href="https://valohai.com/">Valohai</a> - Train, Evaluate, Deploy, Repeat. Automates everything from data extraction to model deployment
- <a href="https://gradient.run/">Gradient</a> - Develop, track, and collaborate on Deep Learning models
- <a href="https://polyaxon.com/">Polyaxon</a> - Reproduce, automate, and scale your data science workflows with production-grade MLOps tools
- <a href="https://neptune.ai/">neptune.ai</a> - Log, store, display, organize, compare and query all your MLOps metadata
- <a href="https://www.tecton.ai/">Tecton</a> - Enterprise Feature Store for Machine Learning


See more platforms here: <a href="https://mlops.neptune.ai/">mlops.neptune.ai</a>


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="final">Final thoughts</h2>

The machine learning space is evolving rapidly and it's great to see best practices and tools emerging to make productionisation of models faster and more robust. However, there is still a long way to go!!

<a href="/img/ml-productionisation/xkcd_data_pipeline_2x.png"><img src="/img/ml-productionisation/xkcd_data_pipeline.png" alt="xkcd comic of data pipelines" /></a>
<span class="caption text-muted">Source: <a href="https://xkcd.com/2054/">xkcd.com</a></span>


<!-- ---------------------------------------------------------------------- -->
<h2 class="section-heading" id="additional">Additional resources</h2>

<h3>General Resources</h3>

- <a href="https://www.awesomepython.org/?c=ml-ops">awesomepython.org MLOps</a> - A collection of GitHub repositories related to MLOps
- <a href="https://ml-ops.org/">ml-ops.org</a> - Great MLOps resource by <a href="https://www.innoq.com/">innoq</a>
- <a href="https://mymlops.com/">mymlops.com</a> - Build your MLOps stack by <a href="https://www.linkedin.com/in/tanel-sarnet/">Tanel Sarnet</a> and <a href="https://www.linkedin.com/in/nathaliamdc/">Nathalia Campos</a> 
- <a href="https://arxiv.org/abs/2209.09125">Operationalizing Machine Learning: An Interview Study</a> arxiv paper by Shankar et al, 2022
- <a href="https://arxiv.org/abs/2205.02302">Machine Learning Operations (MLOps): Overview, Definition, and Architecture</a> arxiv paper by Kreuzberger et al, 2022
- <a href="https://arxiv.org/abs/2304.07296">MLOps Spanning Whole Machine Learning Life Cycle: A Survey</a> arxiv paper by Zhengxin et al, 2023
- <a href="/resources/ml-productionisation/The Big Book of MLOps (Databricks, v6, 2022).pdf">The Big Book of MLOps (pdf)</a> by <a href="https://www.databricks.com/p/ebook/the-big-book-of-mlops">Databricks, 2022</a>
- <a href="/resources/ml-productionisation/MLOps - A Holistic Approach (wandb, 2022).pdf">MLOps - A Holistic Approach (pdf)</a> by <a href="https://wandb.ai/site/holistic-mlops-whitepaper-download">wandb.ai, 2022</a>
- <a href="/resources/ml-productionisation/Practitioners guide to MLOps - A framework for continuous delivery and automation of machine learning (google cloud, 2021).pdf">Practitioners guide to MLOps - A framework for continuous delivery and automation of ML</a> by <a href="https://services.google.com/fh/files/misc/practitioners_guide_to_mlops_whitepaper.pdf">google cloud, 2021</a>
- <a href="/resources/ml-productionisation/Software Engineering for Machine Learning - A Case Study (Microsoft, Amershi et al, 2019).pdf">Software Engineering for Machine Learning - A Case Study</a> by <a href="https://www.microsoft.com/en-us/research/uploads/prod/2019/03/amershi-icse-2019_Software_Engineering_for_Machine_Learning.pdf">Microsoft, 2019</a>
- <a href="https://mlops-guide.github.io/">MLOps Guide</a> - An MLOps Guide to help projects and companies to build more reliable MLOps environment.
- <a href="https://github.com/kelvins/awesome-mlops">awesome-mlops</a> - A curated list of awesome MLOps tools
- <a href="https://www.youtube.com/@MLOps/playlists">MLOps.community on youtube</a> - Machine Learning Operations best practices from engineers in the field


<h3>Study Resources</h3>

- <a href="https://github.com/DataTalksClub/mlops-zoomcamp">mlops-zoomcamp</a> - Free MLOps course from DataTalks.Club
- <a href="https://github.com/graviraja/MLOps-Basics">MLOps-Basics</a> - A series on the basics of MLOps (model building, monitoring, config, testing, packaging, deployment, cicd, etc)
- <a href="https://github.com/SkafteNicki/dtu_mlops">dtu_mlops</a> - Resources for the machine learning operations course at <a href="https://kurser.dtu.dk/course/02476">DTU</a>.

