* What instrumental variables?
  * Affect infrastructure but not GDP. Corruption
* Questions



## Laila Sprejer

* Violence directed at women BECAUSE they are women of affects women disproportionally
* Specially targeted if
  * Power
  * Feminist issues or topics of "men expertise"
  * Being young and intersecting identities
* 2 previous studies. 
  * Women in parliament common across parties and gender
  * UK candidates. High variance between politicians but no gender differences.
    * :question: Why these results?
* Argentinian situation
  * :question: Who has twitter? Even if they have misogynistic views, do they openly show them:

Questions:

* What % of violent tweets per gender, topic and on what grounds?
  * Stereotypes or negative representation? 
  * :question: What is the difference??

Strategy

1. Collect tweets, 
2. Identify abusive tweets (
   1. dictionary, 
   2. Perspective API
   3. Transfer Learning
3. Identify their topics
   1. STM because use of Gender and Party covariates
      1. :question: Proportion of men and women in parlament/parties?

Questions:

* What are the targets?
  * :bulb: Timing (usually campaigns come and go)
  * :bulb: Look at "bad" niknames (hillary), "Lock her up", ...
* Argentine insult dictionary:
  * :bulb: We had these data from Wikipedia "negative" posts (ML). I you can get the ones from Argentina you can get a good sample of insults.
* Detect stereotypes
  * We heard of this topic modelling methodology that didn't needed a number of topis? I don't know...

> You know I had this though an hour ago in which I thought that my whole idea is wrong
> Cause the individual effect of the politicians is just too large
> like. How can I know if they are targeting the person or the women
> You know what I mean?
> If women are systematically targeted more than men I might have a point, but otherwise, I’m just comparing politicians
> And there are always popular and unpopular ones, hateful ones, etc etc
> I’ll have to find a convincing way of taking this into account in my analysis

## Charmaine

Seeing women in STEM trough online media

* Main factor: self selection bias. ¿why? 
  * by stereotypes of ability and cultural fit
* Effects: direct (less girls) and indirect (harder for them - teacher's attitudes/expectations)

The role of the media:

* Reinforce or counteract the stereotypes:
  * Women are underrepresented and and misrepresented

Gaps in literature:

1. Little previous research and NO focus on online news, (more popular now)
2. Small-sample size problem due to manual hand-coding process

Questions:

1. How coverage of men and women scientists differ (in overall numbers)
2. How their portrayals differ?
   1. Subordination, some fields, frequent words...

## Davide - Predicting recession with ML (with enough notice):

:question: What are your new predictors? 

Literature: Estrella (1991): Yield curve, Estrella (1998) + NYSE composite... Now it is done with multiple predictors.

ML: SVM and Random Forests: good results but black box (2015, 2016)

**Proposal**: Shrinkage models

* **:question: The Lasso has been here since 1996 (Tibsiriani), and it's a popular method in statistics. What makes you think it has not been used before if RF and SVM have been used?**
* :question: Why do not use time series models?

Ideas:

* No not throw the monthly data
* **Maybe recessions from other countries are less researched**
* **Why use the EM model as benchmark and not the Random Forests one? :question:**



## Parker:

Only one survey to understand the US trans "experience"

Design:

+ **Qual**: 
  + Data: documents
  + Critical discourse analysis to critique the power relation between the HRC and trans community
+ **Quant**: 
  + Data: Subredits
  + Keyness, h-means, collocations (similarity between authors)
  + LDA and k-means

Objectives:

* Apply text analysis to quantify the transgender experience: replicable and faster large-scale dataset

## Maria José - Characterizing UK mortgage prisoners using logit and Unsupervised L.

Regulatory change: "responsible new rules":

* Affordability and **verified income**
* Intrest rate stress test
* Not allowed to offer intrest-only proposal when there is no collateral.

These avoid people from changing mortgage lender! and made them "mortgage Prisoners"

Literature:

* Wittaker (2014) - 770.000
  * Self employed
  * interest-only mortgages
  * Spend > 33% on payment
* FCA and UK Finance (2018) - 30.000
  * MORE data + specific

:question: What are your judgments on what they did wrong and right? What would you do differently / better?

Questions:

* How many are now? --> Meh
* What are they characteristics?  --> Interesting!

Data:

UK Household longitudinal survey. (2014-2019)

* :question: Does it provide you with less data than previous research?
* :question: Why choose one definition over the other for data availability? Isn't the other way around and we choose data depending on the definition?
* :question: "The impact of policy on people", careful with causal speech

## Julia - The effect on the Gender pay gap on the UK Labor market

Situation:

* Obligation to report the within-firm Gender pay gap for firms >250 persons after 2017.
  * Short-term solutions identified in the literature:
    * Might induce to outsource low paid "female" jobs
    * Limit hiring young women

Question: **What are the channels trough which this policy affects female employment in the UK?**

Data:

Quarterly Labor Force Survey (2013-latest release)

* short time frame To keep things constant and good covariates

Regressions:

Log(hourly pay) = a + controls + interactions with female + b_rdd_* AfterPolicy

:imp: 

* **I think B_RDD_\* after_policy \* female is needed to?**
* OR use only data that is VERY close to the policy implementation?
* '+' I would add a "trend/s" to avoid mixing it up with the treatment effect
* Test: will the interacting variables change with the inclusion of RDD?
  * She expects they will increase
* :question: Do you know if the wages are from firms >250?
* Look at quantiles and these types of models (model the percentile)

## Ignacio Fernandez - Predict student dropout in Chile

Chile has 3 institutions:

* Universities
* Technical training centers
* Professional Institutes (working class)

Question:

* Understand the factors that "influence" attrition in different institutions
* Accurately predict de potential risk of student to drop-out
  * :question: Are you planning to use survival models? It gives probably a good theoretical and predictive accuracy. Also they can be used to get causal estimates if you find a source of exogenous variation (such as their grades close to 5/10)

Data:

* Admin data from student's pre-enrolment characteristics + characteristics of institution and program attended
* :bulb: 2009-2018 - **Environmental variables** contingencies
  * Increase 50% of GDP/capita
  * Wages (male/female) (?)
  * Unemployment (male/female) (11% -> 7%)
  * Employment (male/female) or sectors of the economy
  * Gov.expendeture in education (17 -> 21% of gov. expendeture)
  * Gov. expendeture per student tertiary education (% gdp per capita) (12% -> 20%)
  * School enrolment (tertiary educ) (60.000 - 88.000)
* 
  * Mean wage, possibly local (location of the institution)
  * Recession or not?

:question: Ethical issues regarding who gets a grant, who is more likely, with people more humble origins being specially affected.

## Pauline Ting - Nowcasting the economy!

Nowcasting 

Focus on use crowd sources data (fine grain, immediate )

* TripAdvisor  --> Restaurant Industry (Yelp already used) 
* AirBnb --> Housing industry ()

Questions: Can they do it? Which platform is better?

* Predict --> Average house price + Average Income Level per postal code.
* :question: Why do not use the last census as data too?
* :question: Aggregate economic level: Night lights?

Methodology:

* Q. text: Neighborhood and description:
  * Forcibly biased to get money?
* Regression Analysis:
  * Model selection and interpretation.

## Marie Legrain - How individuals experience of COVID-19 pandemic?

* Impact of external shocks on metal health and emotions:
  * Natural disasters, War-related shocks, Flu, Ebola...

Questions:

* How have emotions of tweets have evolved since the start of the pandemic in the UK
* What are people in the UK more concerned about in their tweets?

Data:

* Streamed tweets from the 10th of March

Strategy:

1. Sub setting the relevant data (UK, Coronavirus, ...)
   1. Hand labeled 10.000 tweets
2. Dictionary-based Sentiment analysis (Emotions and others) and correlate with real events in time
3. Topic Modelling With Latend Dirichlet allocation (LDA) to identify topics and classify text

:bulb: Advice:

1. 5.000 should be more than enough?
   1. It is representative
2. Using a dictionary of US vs UK words and discard US-wording (Australian, ...)



## Betoria Yuan

:question: Not causal, isn't it?

## Jenna Chang

Consumer inflation expectations and sentiment analysis

Q: How Social media and people's SES respond to inflation forecasts?

Data: 

* Inflation expectations
* Twitter posts
* Economic Phases

## Jingie Gao

#### **Tracking Idiosyncratic Happiness and its Determinants via Tweets: A Study for Location-tagged Tweets in the UK**

Motivations:

* Social media have ben successful for tracking geographical variations in health
* Nowcast happiness with bigger geographical attainment.

Question:

* Focus on **methodological approach** to nowcast happiness measure with twitter data
* Investigate the characteristics associated with happier regions

Data:

* Real time English-Language tweets in the UK
  * :question: Why English Language? -> London (French, Arab..., .
  * :question: Delete non-personal accounts (bots, businesses)

Method:

* :question: Why do not maximize the aggregate instead of the individual level?

 :exclamation: Not a representative sample to twitter or even less to the wider population



> hiiiii!!!!!
> Thank you so much!!!
> Regarding the data, yeah, that’s a issue that I have atm and also bc geo-tagged tweets are only a small proportion for wider population. But since I’m trying to maximise the number of tweets with accurate geolocation mapped to regional levels. So it’s a trade off I sort of made. But I’ll defo elaborate this part in my research about this bias
> Thee method part: I’m doing a comparison between (1) maximising aggregate proportion, and (2) maximising number of accurately mapped individual documents
> And see which one performs bette





