# Meeting follow-up 1

02/06/2020

First Note:

> Many thanks for your critiques and questions on the first meeting it helped me question some assumptions that are very important to the project and we have not discussed previously with Raúl.

Summary of the points:

1. Sample definition. What are the benefits of doing more cities?
2. The claims I want to make
3. Possible flaws or confounders
   1. Endogenous local public spending
   2. The German scrappage program of 2009
4. Which predictors to use for each outcome?
5. Additional Questions
   1. Is this a "sizable" effect?
   2. SUTVA, is it ok?
   3. How convincing the effect on economic outcomes really is?
   4. Additional questions from the call



## Sample definition. What are de benefits of doing more cities?

Benefits of both alternatives

| Aggregate / 5+ cases                                         | Specific / 1 - 4 cases                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Increases external validity from a higher diversity of applications | Increases external validity by a better understanding of the specific cases |
| Does not need a strong German                                | Is harder without knowing German (I don't know German)       |
| Allows for data-based external validity (reverse synthetic control) |                                                              |
| I am more specialized and feel more comfortable in this arena |                                                              |

I think I will keep with the aggregate approach.



## What are the claims that I want to make?

* The application of the LEZ created an effect of **X** size on GDP and labor outcomes for each year of it's application, for each city.
  * GDP is the hardest goal as is the one with more confounders, if it is too hard I could only look at the effects on labor outputs.
* Those effects can be decomposed on the direct and trough-pollution effect which are **Y** and **Z**, respectively



## Possible flaws and their respective possible justifications/corrections:

How to test for economic policy differences (that cities that apply a LEZ have also applied economic stimulus? 

Argument theoretically:

* The decision is not completely optional, it mainly comes from the obligation to comply with the European Commission regulations in air quality, thus self-selection is less likely and other policies have not been strong enough to avoid EC fines. -> Works for pre-intervention differences

Do robustness tests:

* To a "Backdating" test, if the Synthetic control accurately predicts the pre-intervention path, it should be credible as a counterfactual. -> Works for pre-intervention differences

Control for possible confounders:

* Look at local data on administration's spending ([OECD](https://stats.oecd.org/Index.aspx?DataSetCode=REGION_DEMOGR#)) 

  * :information_source: Germany's expenditure in 2016 was a 44% of GDP 
    * Sub-national expenditure was a 48% of total expenditure, with a 16% being local and the other 32% being regional/federated government. $\rightarrow$ Local gov spends around 7% of GDP

  * Data on local public expenditure, to control for possible differences:
    * Nº of employees for 1000 inhabitants/ NUTS3 [data](https://www-genesis.destatis.de/gis/genView?GenMLURL=https://www-genesis.destatis.de/regatlas/AI015.xml&CONTEXT=REGATLAS01).
    * Expenditure by municipality/district: Very detailed data from [Genesis](www.regionalstatistik.de/genesis). :arrow_right:
      * Data (1995-2014) varies by region and city, some have complete data and some do not.
      * Seems like the year **2006** is available for (almost) all geographies. I could control for expenditure/capita at that year
    * Taxes by municipality/district, also by Genesis
    * *Preliminary*: Municipalities expend 2-9 times more than districts
  * :bulb: There is significant sub-national expenditure, but local expenditure, and especially their variance should not be a strong force driving local GDP. I could control for heterogeneity in **pre-treatment** local expenditure that could influence post-treatment GDP.

* Look at the scrappage program, how much that involved in terms of public investment and if it was concentrated in LEZ cities.

  * (see `scrappage program details` below)
  * :bulb: I can estimate the expenditure per city of that program and control for it.

* **Including these variables might involve restricting the control pool to only German Cities, which reduces comparability for big cities and lack of controls for late-adopters**
* 

### Scrappage Program's details:

* Part of a group of similar programs around the world in 22 countries 2008-2010. It was the biggest (€5Bilion, Japan €2.9b and the US €2b)
* **61€ per capita** in GER (an average of 0.15% of GDP per capita)
* **Timing**: Announcement of idea: 27 dec. 2008. Becomes 2 weeks latter. Starts on January 14 2009. Points published Jan 16. Applications were possible until September 2, 2009.
* **Size**: 2500€ for each old car (older than 9 years, licensed for 12 months) to buy a new one (that had at least the Euro 4 standard and was licensed to the claimant - "Actually, for the German case, this prerequisite was redundant since all new cars bought in 2009 were Euro 4 equipped anyway.") Only for private individuals. 2 million cars were subsidized.
* Data to control for it:
  * Passenger cars, by
    * [age - All of germany](https://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=road_eqs_carage&lang=en), [(more transport data for all the country)](https://ec.europa.eu/eurostat/web/transport/data/database)
    * Co2/new passenger cars [data by country ](https://www.eea.europa.eu/data-and-maps/data/co2-cars-emission-16)
  * Data on registrations/stocks/many more 
    * [yearly data on PDF:](https://www.kba.de/SiteGlobals/Forms/Suche/Statistik/Fahrzeuge/Fahrzeuge_Formular.html?nn=772208&cl2Categories_Unterthema=zulassungsbezirke_und_gemeinden&resultsPerPage=15&sortOrder=dateOfIssue_dt+desc%2C+title_sort+desc&cl2Categories_Darstellungsart=download) 
      * nº of personal cars by municipality
      * Decommissioning of vehicles by age (all germany)
      * nº of vehicles by env. sticker by month and federal state
      * nº of scrapped cars by district 
    * :bulb: I could ask for the data from Wolff (2013) or some specific data from the German office ([link](https://www.kba.de/DE/Statistik/Forschungsdatenzentrum/forschungsdatenzentrum_node.html)) -> *district-wise number of scrappaged cars from January to September 2009*
* Possible estimates of relative expenditure in the scrappage program with the data I can get:
  * Nº of scrapped cars in 2019 per district $= S^d_{2009}$. Normalized to sum to 2 million
  * $S^d_{2009} * \frac{\text{Total Scrappaged cars in 2009}}{\text{Nº Scrappaged cars with +9y in 2009}}$. Normalized to sum to 2 million.

## Which predictors to use?  

* I need city-level data for each one of all treated and control regions
* Important to test their balance,
* Variables with ":heavy_plus_sign:"​ add additional certainties but might restrict the control pool only to German cities.

**For GDP:**

* Usual GDP predictors:
  * Investment, Education level, Industry share, GDP-per-capita
* New (subject-specific) Predictors
  * :heavy_plus_sign: ​pre-treatment local public expenditure
  * :heavy_plus_sign: Estimated expenditure on scrappage program
  * Possible: Car counts from monitors all around the country, possibly hourly data ([link1](https://www.bast.de/BASt_2017/DE/Verkehrstechnik/Fachthemen/v2-verkehrszaehlung/Daten/2008_1/Jawe2008.html?nn=1819490&cms_strTyp=A&cms_map=0), [link2](https://www.mdm-portal.de/aktuell/)) 
    * :question: Even if you mentioned in the call, I understand it might be **affected by** the policy and not as much as a control for change in GDP. I would use it, if it made sense, as a mediator for the effect of LEZ on Pollution.

For $\text{Productivity}: $ $\frac{GDP}{\text{Hours Worked}}$:

* GDP/capita
* Investment/capita
* Wage levels or income levels
* Usual nº of hours worked (France Vs All others)
* Share of Men or women in the work market
* Educational level
* :heavy_plus_sign: Pre-treatment public investment
* :heavy_plus_sign: Estimated expenditure on the scrappage program

**For absenteeism / temporality:** $\frac{\text{Hours Worked}}{\text{Employed Pop.}}$

* Share of Men or women in the work market
* Share of households with elders / children
* Investment/capita
* Wage levels or income levels

**For Employment:** $\frac{\text{Employed Pop.}}{\text{Working Age Pop.}}$

* Investment/capita
* Wage levels or income levels
* mean age

**For proportion of working age population**  $\frac{\text{Working Age Pop.}}{\text{Total Pop.}}$

* Mean age
* Mortality and birth rate
* *(look at who gets more affected by pollution mortality)*

**For Population:**

* Life expectancy
* Proportion of elderly population
* *(look at who gets more affected by pollution mortality)*

**For Pollution:**

* It is better if I can create de-weathered pollution measurements. There are R packages that help with that.



## :question: Questions to solve: 

### 1 - Is this a "Sizable" effect?

To be able to identify a treatment effect, its size should be bigger than the individual transitory shocks of regional outcome variables. From preliminary inspection of the data I expect individual transitory shocks to be around 0.5-2% of regional GDP per capita.

+ If the noise in the outcome variables is relatively high, it’s possible to use de-noising techniques such as the ones proposed by Amjad et al. (2019).

(2 effects in the economy: positive and negative)

* **Positive**: Reduction of pollution: $TreatmentEffect_{LEZ\rightarrow Pollution}$ -0.67 to -1.3$\mu g/m^3$ (Gherritz 2017), which translates to a close-to-1% reduction in GDP according to Dechezlepêtre (2020).
* **Negative**.
  * Very discussed study gives a 7% decrease in costumers in the city center (Germany).
  * TFL first-differences approach gives no significant positive or negative results.
  * Just this from **Gehritz (2017)** looks like some preliminary evidence of an increase on unemployment:
    * Looks like a 1% difference (10% increase) in unemployment that is bigger than idiosyncratic shocks):

<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\PM2.5\Capstone-Project\Easter situation - Meeting with Raúl 052020.assets\Unemployment rates in early and late german adopters.jpg" width="500px" />

(Early adopters of German LEZ have a relative increase in unemployment relative to late- and never-adopters

### 2- SUTVA, is it ok?

I guide myself with the research done by Wolff (2014) and Gehrsitz (2017) on the effect of German LEZ on pollution, health and vehicle composition to understand the possible spillover effects present within and between German cities. A summary of their findings is as follows: 

1. Wolff (2014) concludes that the application of a LEZ also reduces pollution in surrounding areas but this is only significant with big and strict LEZ. Gehrsitz (2017) finds a non-significant effect on pollution reduction in surrounding areas of a LEZ. 
2. Wolff (2014) shows that the application of a LEZ correlates with a change towards cleaner vehicles and cities close to it (<50km) also seem to experience these changes. The correlation is close to a 1-to-5% change in the vehicle composition of a nearby city. Nevertheless, Gehrsitz (2017) looks for a causal effect on pollution reduction and concludes that for a given city “the introduction of an LEZ in a nearby city does not appear to translate into reductions in fine particulate pollution.” and adds that his results “indicate that any violations of the SUTVA due to spillovers are unlikely to induce substantial bias into the main results”. In conclusion, some spillovers are possible in specific cases for the outskirts of a large LEZ, but unlikely or  economically insignificant if the city is not sufficiently close. This is crucial information given close cities might be especially good controls if these spillovers are not present.

The choice of units in the donor pool, for which I will restrict it to cities outside a 50km radius from a LEZ or inside the same NUTS2 region as the treated LEZ and unite the Rhine-Ruhr metropolitan area as an unique city. Additionally, I plan to perform a leave-one-out re-analysis to check if the inclusion of any individual controls is driving the results of a given city.

* This is done by re-computing the SCM estimates each time without one control that helped create the synthetic control. If a control strongly changes the estimates it might have probably had strong shocks during the time of the study.

### 3- How convincing the effect on economic outcomes really is?

If two cities, treated and synthetic control, have the same pre-treatment path of GDP/capita and very similar values of 

1. Local Investment, Education level, Industry share,
2. :heavy_plus_sign: pre-treatment local public expenditure (2006)
3. :heavy_plus_sign: Estimated expenditure on scrappage program,

and are sufficiently distant in space to maintain SUTVA.

Is it **credible** that the difference in GDP is the causal effect of the policy?

Is it more credible for labor market indicators such as productivity and employment?



### Additional questions left unanswered on the call:

* Does the national German legislation says what to do with the funds generated from the LEZ?

  * :information_source: As I understand the implementation of a LEZ is responsibility of municipalities and districts and probably they do get the benefits from fines.

* What are the relative sizes of German LEZ? Relative to their city?

  * [Previous research](https://figshare.com/articles/_Overview_of_low_emission_zones_LEZs_in_German_cities_included_for_analysis_17_LEZs_in_6_federal_states_/1136302/1) indicates it goes from 30% to 80% of the population of a city inside of it with a mean of 40%.

  * :information_source: I have the geo-shapes from OpenStreetMap.org for and data on population to calculate each zone's relative size. I also have measures of cities extend by NASA and Eurostat. 

    

