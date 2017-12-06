---
layout:     post
title:      "Topic Modelling Part 2: Python Code"
subtitle:   "How can I perform topic modelling with Python?"
date:       2020-12-07 09:00:00
tags:       [Machine Learning, Topic Modelling]
author:     "Dylan Hogg"
header-img: "img/post-bg-04.jpg"
published:  false
comments:   true
---

<p style="color:red">BLOGPOST IN PROGRESS</p>

<h2 class="section-heading">Code libraries for topic modelling</h2>

<p>TODO TODO TODO TODO TODO TODO</p>

{% highlight python %}

# LDA can only use raw term counts for LDA because it is a probabilistic graphical model
tf_vectorizer = CountVectorizer(max_df=0.95, min_df=2, max_features=num_features, stop_words='english')
tf = tf_vectorizer.fit_transform(documents)
tf_feature_names = tf_vectorizer.get_feature_names()

{% endhighlight %}

{% highlight csharp %}

/*
 * C# Program to Swap two Numbers
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace Program
{
    class Program
    {
        static void Main(string[] args)
        {
            int num1, num2, temp;
            Console.Write("\nEnter the First Number : ");
            num1 = int.Parse(Console.ReadLine());
            Console.Write("\nEnter the Second Number : ");
            num2 = int.Parse(Console.ReadLine());
            temp = num1;
            num1 = num2;
            num2 = temp;
            Console.Write("\nAfter Swapping : ");
            Console.Write("\nFirst Number : "+num1);
            Console.Write("\nSecond Number : "+num2);
            Console.Read();
        }
    }
}

{% endhighlight %}
