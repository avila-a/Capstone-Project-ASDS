Notes on capstone project



###### Summary of the points:

1. Fast facts on the project
2. To-do list
3. Timing
4. Doubts and possible problems



Title: 

+ The effects of the application of German LEZ in labor outcomes, a polluted history
+ Cleaning the labor market's lungs: The effects of ...

Motivation: 

* Studies on pollution on labor outcomes
* Resistance to application of LEZ
* Evidence from a part of the environmental effects in the economy.

Strategy:

* Cities are units represented by their NUTS equivalent.
* Test the effect of the application in multiple labor-related outcome variables, mediated by pollution: 
  * **ONLY NUTS 2 cities:** Hours worked per person, 
  * **ONLY NUTS 2 cities:** Wages per person, 
  * Employment/unemployment, 
  * Proportion of working age population, 
  * Total population

Data:

* Outcomes:
  * German + Europe as a control: Eurostat
  * German + German as a control: German geo statistics
* Pollution data for Germany and Europe
* Announcement date of each LEZ

Possible results:

* Some cities have significant effects and some do not



## To-do list



GET DATA

- [ ] Review that I have data on outcomes, treatment and mediator

  - [ ] Important / basic :

    - [ ] TREATMENT

      - [ ] Announcement date of LEZ for each German city :exclamation: (insert in umweltezonen.xlsx)
        - [ ] Asked for that info to the German ministry, they should answer soon.
      - [x] LEZ stage of each LEZ in Germany
      - [x] Treatment status of every other European city to discard treated

    - [ ] OUTCOMES

      - [x] Employed population / economic sector (Employment)
      - [ ] Hours worked / economic sector (NUTS 2)
        - [x] For all countries but France and Poland, getting it soon
      - [x] Unemployment (NUTS 2)
      - [x] Working age population (age distribution - NUTS 3)
        - [x] Active population by age and sex (NUTS 2)
      - [x] Total population

    - [ ] MEDIATOR

      - [x] yearly pollution means

      - [x] Calculation for NUTS2 (in Create SQL)

        - [ ] **(extra)** Number of peaks and "high pollution episodes"

          - [ ] Pollution measurements of all stations, daily data.
          - [ ] Figure out how I will count the number of peaks

        - [x] yearly pollution means  

        - [x] "population weighted", to know the real effect on the population

        - [x] "GDP-weighted"

          - [x] Grid of population density for all of Europe

          - [x] Grid of GDP proxy for all of Europe

          - [x] Grid of PM2.5 pollution (yearly) in Europe

          - [ ] Grid of NO2 pollution (yearly) in Europe

            

  - [ ] Controls / secondary 

    - [x] Environmental plans (Germany + others Europe)
    - [ ] To control for absenteeism / temporality **(NUTS 2 cities)**
      - [x] Economically active population by sex and Sector (N 2)
        - [x] Share of men or women in the work market (N 2)
      - [ ] Share of households with elders / children
        - [x] Proxy: Dependency ratio based on aggregate ages
      - [ ] Investment/capita (NUTS 2)
        - [x] For all countries but France and Norway, getting that data soon
      - [ ] Wage levels or income levels (NUTS 2)
        - [x] For all countries but France and Poland, getting it soon
    - [x] mean age
    - [x] Mortality and birth rate
    - [x] Proportion of elderly population
    - [ ] **(extra)** Size of the zone compared to the size of the city
      - [x] perimeter of zones
      - [x] perimeter of cities
      - [ ] (not yet calculated)

- [ ] Choose which Cities I will start with

  - [ ] Choose based on Relevance, if it's NUTS2, better, If I have the geography, better.
  - [ ] Find the name of the city that had an specially bad effect (small city in the border)

- [ ] Review that all sources and statistics make sense in size and in interpretation.



CLEAN DATA, SUMMARY STATISTICS

- [ ] Get all data in one same spatial definition
- [ ] Summarize data
- [ ] Information for selection of control regions
  - [x] NUTS 3 in the same NUTS 2 region
  - [ ] Are they going to change in time? (dynamic set of controls?) NO
  - [x] Discard Rhrine-Ruhr area as a control
  - [x] 
- [ ] Create a **list of possible controls** for each treated city
  - [ ] Bound overall differences in levels of predictive variables pre-intervention (maximum and minimum)
    - [ ] Restrict big relative or absolute differences in controls?
    - [ ] Remove "rural" NUTS regions? (or those with different pop densities?)
    - [ ] Remove very south-european / meditarranian economies?
  - [x] Restrict cities outside 50-100km of a LEZ AND outside the same NUTS2 region (+ unite the Rhine-Ruhr area)
- [ ] Review it is ready for analysis (clean and meaningful)
  - [ ] Re-run code to get data from Eurostat

INTERMEDIATE TASK

- [ ] Pull together a **sketch of the outline** and skeleton of the ideas on how to structure the paper with small resumes or ideas for him to criticize.

START ANALYSIS

- [ ] Do Synthetic Control for some cities and each outcome
  - [ ] First check which combination of controls reduce pre-treatment RMSE and choose accordingly
  - [ ] Do robustness checks:
    - [ ] Sizable effect: check pre and post (RMSE)
    - [ ] Check if restricting controls further changes results (SUTVA)
    - [ ] No anticipation: do various pre-intervention placebo tests (maybe try the announcement/implementation of the first LEZ)
  - [ ] Try if I can differentiate the effects of different stages of LEZ (ATE for each period?)
- [ ] Try to perform and include in the final project:
  - [ ] Try to do MASC
  - [ ] Try to do a "Inverse" synthetic control for a couple untreated cities (Hamburg being the principal of them)
  - [ ] Try to create a webpage that displays the methodology, data and results in an interactive way.

- [ ] WRITE the results.



## Timing

JULY

- 29-04: Finish to get data and start data cleaning
- 6-10: Finish data cleaning and hopefully do first analysis before last meeting. Look if ratio signal/data is good enough for Synthetic Control
- 11-13: Write skeleton of research explaining "what" and "how" I plan to explain in each section and sub-section
- 14:  Last meeting with Alasdair
- 15-18: Do analysis of Synthetic control and robustness tests, attempt to do MASC and alternative methods
- 20-25: Write most of the text, check for mistakes and have something solid.

AGOUST

- 27-01: Iteratively correct and improve text, try to do inverse synthetic control.
- 3-6: Review, re-read, and present
- ¿possible extension?



## Skeleton of paper

### Tentative Index:

1. Introduction 
   1. Reasons for LEZ (Pollution -> health -> legislation -> objective is to reduce pollution)
   2. Economic critiques of LEZ (Economy, Investment, )
   3. Why and how (literature)  a reduction of pollution can improve the economy? (theory of change)
   4. My question, Does this apply to LEZ (does pollution mediates...)?
2. Data Sources / Analysis techniques /
3. Results
4. Conclusions



## Notes on things to remember:

Pollution as a mediator:

* They are other mediators, justify why you choose pollution.
  *  The INTENSION of the policy is to reduce pollution, and the externalities of the policy are (supposedly) negative economic effects. 
  * *A: Think outside the box. Look at research in LEZ. Situating the analysis in this debate!  And starting the paper of with this discussion as the main motivation to study the direct and mediated effect. Create the theoretical skeleton / background of the study.*
  * *A: Create a clear THEORY OF CHANGE (Theory of causes and effects) and do it to justify the research question* 
    * (and the conclusions?)



* *A: The case from the border is a "deviant case analysis" to understand what is happening in the main cases in a strong way.  Describe why I do it and frame it in methodological terms. It's the strength of STRONG examples.*

## Doubts and possible problems

* **Worst case scenario:**
  * Size of heterogeneous shocks is too big, there is too much noise and an analysis is not possible:  
    * Diff-in-Diff (pooling), Diff-in-diff with matching (more similar to Synthetic C.)
    * Noise reduction techniques
  * *Alasdair: The important really is how you did it and the methodological decisions that took you that path: STRONG justification for project, methods and explanation of results. I you can't show anything explain WHY in a good way and how you tried to solve it. If there is no statistical significance talk about p-hacking and the importance of "non-significant" research.*
  * *Important: RELLY STRONG METHODOLOGICAL WORK, that is the IMPORTANT part. I know p-hacking and I'm not going to do it.*
    * Do an alternative project
      * Look at the effect of LEZ in pollution (already studied with diff-in-diff,  but as a test of new methods and for each city)
      * Another project it's close to being finished for Spatial Econometrics: The effect of non-attainment in strategic pollution reduction.



* Should I put everything in **relative terms (rates) instead of overall values?** This increases the common support.
  * Does this decrease its credibility to you?
  * *Alasdair: If its hard to create a berlin. Make a STRONG case. JUSTIFY everything, why are you taking relative or absolute rates. ¿do both? You con test different ways an analysis can be done and how this affects the results.*

 

* Keep the possibility of **focusing in 3-4 cities instead of doing all**

  * I think this can make the final document easier to write and understand. Even if I do them all, focusing in some examples should be good. (Choose examples of different types of cities.)
  * *Alasdair: This is a good idea, especially given the limits of text the paper has (10.000 words). You have to justify the RATIONAL behind choosing them ¿economic or academic importance? Biggest cities or the more "interesting/heterogeneous" set?*
  * An appendix in which other (non-core) city results are analyzed and checked might be a good idea.



* **Announcement dates and biased results.** If there are no significant effects in a pre-intervention placebo, then can I say there are no significant anticipation effects?
  * *Alasdair: Placebo IS ok.* 
  * *Its GOOD that I try to do it and others have not, even if I don't do it perfectly, or only for some cities. "Lots of the existing research does not look at anticipation effects and I'm going to try to look at it" is a correct way of framing it*



* Do you see other possible flaws or confounding factors?
  * *None mentioned by Alasdair*



* I could report, in an Annex, **the results for GDP and productivity** even if I don't claim causality for those outputs. If they are consistent with the rest of the discourse it might be a good thing to report.
  * *He think this might be interesting, and this can show what further research is needed. Demonstrates that I am aware of the problematics and say how it would be possible to get causal effects for that (mention it in the conclusions, further research and complement with footnote and annex)*



**Other questions:**

* I have had some serious trouble moving my things out of my flat in London, with considerable stress and unability to focus (one week). I am considering to ask for an extension to the deadline.

* I think a great proportion of work has gone into planning a good research strategy, would be a good idea to include a "Research memory" as an Annex?

​		

Thanks for reading and your thoughts!

