# :heavy_check_mark: Notes on capstone project



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

    - [x] TREATMENT

      - [ ] Announcement date of LEZ for each German city :exclamation: (insert in umweltezonen.xlsx)
        - [ ] Asked for that info to the German ministry, they should answer soon.
        - [x] 9 cities to use as treated
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
  - [ ] Find the name of the city that had an specially bad effect (small city in the border) (possibly Aachen, but its really Freiburg)

- [ ] Review that all sources and statistics make sense in size and in interpretation.



CLEAN DATA, SUMMARY STATISTICS

- [x] Get all data in one same spatial definition
- [ ] Summarize data
- [ ] Information for selection of control regions
  - [x] NUTS 3 in the same NUTS 2 region
  - [ ] Are they going to change in time? (dynamic set of controls?) NO
  - [x] Discard Rhrine-Ruhr area as a control
- [x] Create a **list of possible controls** for each outcome (before each treated city)
  - [x] Bound overall differences in levels of predictive variables pre-intervention (maximum and minimum)
    - [x] :heavy_check_mark: Restrict big relative or absolute differences in controls?
    - [x] :heavy_check_mark: Remove "rural" NUTS regions? (or those with different pop densities?)
    - [x] :heavy_check_mark: Remove very south-european / meditarranian economies?
  - [x] :heavy_check_mark: ​ Restrict cities outside 60 km of a LEZ 
- [x] Review it is ready for analysis (clean and meaningful)
  - [x] Re-run code to get data from Eurostat

INTERMEDIATE TASK

- [x] Pull together a **sketch of the outline** and skeleton of the ideas on how to structure the paper with small resumes or ideas for him to criticize.

START ANALYSIS

- [x] Do Synthetic Control for some cities and each outcome
  - [x] First check which combination of controls reduce pre-treatment RMSE and choose accordingly
  - [x] Do robustness checks:
    - [x] :x: Sizable effect: check pre and post (RMSE) -> Dobe By Gobillon/magnac
    - [x] :heavy_check_mark: Check if restricting controls further changes results (SUTVA)
    - [x] :heavy_check_mark: No anticipation: do various pre-intervention placebo tests (maybe try the announcement/implementation of the first LEZ)
  - [ ] Try if I can differentiate the effects of different stages of LEZ (ATE for each period?)
- [ ] Try to perform and include in the final project:
  - [x] :x:Try to do MASC
  - [x] :heavy_check_mark: Try to do a "Inverse" synthetic control for a couple untreated cities (Hamburg being the principal of them)
  - [x] :x: Try to create a webpage that displays the methodology, data and results in an interactive way.
- [ ] WRITE the results.
  - [ ] Summarize data
    - [ ] Summary of variables
    - [ ] Data on relative size on LEZ for NUTS regions (population + Economy)
    - [ ] Actual position of cities in sample, cities already applied and German controls 
  - [ ] Overall Effect
  - [ ] Effect on "local commerce"sector (Transport, services, commerce, retail)
  - [ ] "Inverse" synthetic control method.



## Timing

JULY

- 29-04: Finish to get data and start data cleaning
- 6-10: Finish data cleaning and hopefully do first analysis before last meeting. Look if ratio signal/data is good enough for Synthetic Control
- 11-13: Write skeleton of research explaining "what" and "how" I plan to explain in each section and sub-section
- 14:  Last meeting with Alasdair
- 15-20: Do analysis of Synthetic control and robustness tests, attempt to do MASC and alternative methods
- 21-27: Write most of the text, check for mistakes and have something solid.

AGOUST

- 28-01: Iteratively correct and improve text, try to do inverse synthetic control.
- 3-6: Review, re-read, and present
- ¿possible extension?



### Tentative Index (Skeleton of paper on Overleaf):

1. Introduction 

   1. Reasons for LEZ (Pollution -> health -> legislation -> objective is to reduce pollution)

   1. Economic critiques of LEZ (Economy, Investment, )
   2. Why and how (literature)  a reduction of pollution can improve the economy? (theory of change)
   3. My question, Does this apply to LEZ (does pollution mediates...)?

2. Data Sources / Analysis techniques /

3. Results

4. Conclusions



### Notes on preliminary results - The example of Hannover

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200711082854994.png" alt="image-20200711082854994" style="zoom:67%;" /> Hannover, Bremen and Berlin, It's LEZ and NUTS2 regions

1. Test if I can indeed create a synthetic control with a pre-intervention placebo (the announcement date is 2007 but I act as if it were 2005):

![image-20200710120237717](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710120237717.png)

**Y1** is the real "Hannover", **w.weight** is the synthetic control. To test that there should be no major discrepancies in the pre intervention period (from 2005 to 2007 given the policy has not passed).



I can confidently do this ***only*** for Hannover for overall unemployment.

2. I then create the "real" synthetic control (with all pre intervention periods until 2007, the year of announcement)

![image-20200710120943284](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710120943284.png)



Looks like a good pre-intervention fit. And looks that the LEZ could have reduced unemployment in Hannover.

Furthermore, the control region has very similar pollution levels before the intervention and similar *GDP/capita* and *yearly wages/worker*

![image-20200710131149088](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710131149088.png)



3. Finally I test if this difference is significant by comparing it's magnitude with control regions, especially those that contributed to create the synthetic Hannover. (and restricting to those that have good pre-intervention fit)

![image-20200710121305011](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710121305011.png)



These are the **gaps** between synthetic control and treated (Hannover-DE92_T).  result is that Hannover is not that special, All similar control regions experience a reduction in pollution compared to their own synthetic controls.

The effect is not significant.



Female unemployment is similar but more extreme,  looks like there was a strong reduction in women's unemployment in Hannover, but it is not specific of that city as other German controls also had the same phenomena:

![image-20200710133336299](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710133336299.png)

![image-20200710133411304](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710133411304.png)



### And the Mediator?

On the mediator the results are less interesting, the Synthetic control method fails to find the causal effect of LEZ on pollution reduction even with high quality spatial data. And noise is too big to actually say if there is any effect (or no)

**Pre and post-LEZ** pollution for Hannover (announcement and implementation marked) - It is like this for **all LEZ**, NUTS 2 and NUTS 3.

![image-20200710175447120](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710175447120.png)	Not one result has given interpretable results on the mediator (pollution) after many tries and construction of a pollution measure that specifically targets high productive  and high population locations.



As an interesting research question the role of the mediator is a great idea but it does not apply empirically (faulty data or methods - MASC is only a WP which I had to tailor their code to my objectives and could be working inperfectly.)



## Separate case and analysis:

###  The case of Erfurt (the only experiment on NUTS3 and GDP)

Erfurt is a small city, far away of any major one:

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710200155462.png" alt="image-20200710200155462" style="zoom:30%;" /> <img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710200237997.png" alt="image-20200710200237997" style="zoom:25%;" />

 The good thing is that in announced and applied a LEZ **late** (in 2012) so way after the financial crisis and the "cars" reconversion plan. Given it is only tractable as a NUTS 3 region I don't have data on labor outcomes but continue to have its GDP, GVA and Employment/sector measures.

**This is a preliminary result for GDP (with only German NUTS 3 as controls)**

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710201912169.png" alt="image-20200710201912169" style="zoom:70%;" />

Its test of pre-intervention placebo in 2008 (which does not work very good), Again, it's really hard to predict post-financial crisis performance with pre-financial crisis data)

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710195959549.png" alt="image-20200710195959549" style="zoom:80%;" />

And how this positive effect compares with unit placebos (the treatment effects of regions that acted as controls for Erfurt, mostly small cities.)

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710202528550.png" alt="image-20200710202528550" style="zoom:80%;" />





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
  * The announcement date IS the publication of the Air quality plan, maybe I am seen the effect of the JOINT Air Quality plan measures which the LEZ is an important part.



* Do you see other possible flaws or confounding factors?
  * *None mentioned by Alasdair*
  * **THE financial CRISIS** **ruins** estimates on unemployment with controls from southern Europe. Future LEZ that are applied outside such a big economic transformation could be easier to review. Or be allowed to



* I could report, in an Annex, **the results for GDP and productivity** even if I don't claim causality for those outputs. If they are consistent with the rest of the discourse it might be a good thing to report.
  * *He think this might be interesting, and this can show what further research is needed. Demonstrates that I am aware of the problematics and say how it would be possible to get causal effects for that (mention it in the conclusions, further research and complement with footnote and annex)*
  * I should say why I did not did it and what are the main and strong confounding factors behind that figure (many + Retrofitting plan)



* Remember to THANK to 
  * MASC and the one that send me the code, 
  * LAURA HOSPIDO
  * MI TUTOR + MI PRE TUTOR (sigue siendo anonimo?)
  * Julia
* Remember to cite
  * Packages
    * Synth
    * 



**Other questions:**

* I have had some serious trouble moving my things out of my flat in London, with considerable stress and unability to focus (one week). I am considering to ask for an extension to the deadline.

* I think a great proportion of work has gone into planning a good research strategy, would be a good idea to include a "Research memory" as an Annex?

​		

Thanks for reading and your thoughts!

