# Presentation BdE - Effect of LEZ in economic outcomes:



### Title

* My name is ___ and I will present my final MSc project on the effect of Low Emission Zones in the economy: A Synthetic Control Approach to German Cities.



### Contents 1

* I will first do an introduction on the topic and present the research questions. 
* Then we will look at the data collection and data analysis techniques where I will talk about the Synthetic Control Method and the "Synthetic Treated Method", a methodological contribution to the policy evaluation toolbox.
* Finally we will look at the results and some final notes



### Introduction

#### Who I'm I?



* UPF, TSE - Economics, 
* LSE - Applied Social Data Science,
* LSE - Economic Geography: the effect of air pollution and environmental policies in economic outcomes. 

* As it will become clear in the presentation **this is a work-in process.** An example of a more finished work by me is on the strategic positioning of air quality stations around Europe, and I can send it on request.
* So let's go back to the main topic: **The effect of Low Emission Zones in the Economy**.



#### Pollution and Low Emission Zones

* Air pollution is a very relevant issue recently as pollution levels are high and this has a Strong effect on pleople
* This has caused STRONG european legislation on the topic

#### LEZ in the EU and Germany

* Germans were transpassing EU limits and HAD to pass legislation and LEZ
* 

#### Theoretical background

* Sub-optimal allocation + critiques from the Retail and Transport sector
* Externalities (pollution, congestion)



#### New evidence on the effect of pollution in the economy + citations

* LEZ
  * Reduces pollution and congestion
  * Which increases productivity, reducces mortality and absentism. All of this has positive effects on the labour imput of the economy.
* But, as I said there can be other effects that are negative...
* These are just the sources for the diagram above

#### Why German LEZ? - Why this subject of study?





### Research Questions

A)

B)

C) I will focus more on this one as it is in a better development stage.



### Data collection



#### T. status in Europe

* Show interactive map

#### Temporal application of LEZ in Germany

* Graph
  * Different stages
* Scrappage program
  * Part of a group of similar programs around the world in 22 countries 2008-2010. It was **the biggest of the world** (€5Bilion, Japan €2.9b and the US €2b).
  * **61€ per capita** in GER (an average of 0.15% of GDP per capita)
  * **Timing**: Announcement of idea: 27 dec. 2008. Becomes 2 weeks latter. Starts on January 14 2009. Points published Jan 16. Applications were possible until September 2, 2009.
  * **Size**: 2500€ for each old car (older than 9 years, licensed for 12 months) to buy a new one (that had at least the Euro 4 standard and was licensed to the claimant - "Actually, for the German case, this prerequisite was redundant since all new cars bought in 2009 were Euro 4 equipped anyway.") Only for private individuals. 2 million cars were subsidized.



#### Units of study: NUTS 3 regions

* Statistical units of geographical areas for all of the EU
* Can coincide with local administrative boundaries and represent big and mid-sized cities.



### Data analysis Strategies



#### What are we going to **do**?





#### Introduction on the Synthetic Control Method (SCM) (1)





#### Introduction on the Synthetic Control Method (SCM) (2)



End:

* This can be done with actual weights from a pool of control regions or by other methods. I use a specific type of synthetic control called the "Generalized Synthetic CM" that uses factors instead of weights.

#### (SCM) (3) - Linear Factor models and Gsynth

We model the counterfactual as a set

* Usual Covariates
* Lambda
* Coefficienrs



#### Gsynth



#### Gsynth (2)



#### Identifying assumptions



The usual Identifying assumptions are the same as DID



#### Robustness tests



The usual robustness tests...



#### The potential treatment effect on non-treated regions (1)



#### The potential treatment effect on non-treated regions (2)



#### Notes on creating counterfactuals for **control** regions



* .
* .
* Not the best setting because 



#### The effect on GDP - Presentation of cases



#### The effect on GDP - Individual Results



#### The effect on GDP - Diagnostics

Factor loadings

* Here we can see the different factor loadings of each unit with controls in salmon and treated in blue.
* It is reassuring is that the estimated factor loadings of the 6 treated units lie in the convex hull of those of the control units
  * Treated counterfactuals are produced mostly by more reliable interpolations instead of extrapolations.

Factor's Evolution

* Factor 1 decreases over time
* Factor 2 increases over time
* Factor 3 looks like being "more" affected by the finantial crisis

#### The effect on GDP - Factor Interpretation

Factor 1 is just a negative transformation of mean gdp per capita which makes sense:

* smaller absolute value,  smaller ablosute growth...

#### The potential treatment effect on non-treated regions



* **Now we look at the last results regarding the potential treatment effect on non-treated regions**
* I choose 2011 as a year where more LEZ were announced in my sample I am able to create credible synthetic treated for 3 non-treated regions (X,Y, Z). Here we can see the different implied weights for these regions. 

* In 2011, 7 cities implemented a LEZ two of which had a predicted strong negative effect, one being Magdeburg and are the ones that create the conterfactual.

* Cottbus anf Chemnitz are both East german mid sized cities while Lübeck its a very important port city close to Hanburg in West Germany.



#### Results of the Synthetic Treated Method

* Placebo tratment, 3 years beffore actual announcemnt
* Real control and Synthetic Treated paths
* Potential treatment effect for each city



#### Next steps and discussion



Next steps:

* Contact localities (such as Magdeburg) to check for anystrong economic shock in the post-intervention period
* See the effect on each sector, especially retail and transport.

Points I would like to discuss:

* Credibility of the main results
* How you perceived the "Synthetic Treated" idea, possible weak points and related literature.
* Anything else!





