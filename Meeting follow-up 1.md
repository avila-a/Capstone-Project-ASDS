# Meeting follow-up 1

20/05/2020

## Sample definition. What are de benefits of doing more cities?

Benefits of both alternatives

| Aggregate / 5+ cases                                         | Specific / 1 - 4 cases                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Increases external validity from a higher diversity of applications | Increases external validity by a better understanding of the specific cases |
| Does not need a strong German                                | Is harder without knowing German (I don't know German)       |
| Allows for data-based external validity (reverse synthetic control) |                                                              |
|                                                              |                                                              |



## What are the claims that I want to make?

* The application of the LEZ created an effect of **X** size on GDP and labor outcomes for each year of it's application, for each city.
* Those effects can be decomposed on the direct and trough-pollution effect which are **Y** and **Z**, respectively

## Possible flaws and their respective possible justifications/corrections:

* How to test for economic policy differences (that cities that apply a LEZ are also strongly applying economic stimulus? 
  * Look at properties of Synth. (how it deals with shocks)
  * Look at local data on administration's spending (is there that data on the OCED?) -> There is some national level data on regional % of expediture.
  * Look at the scrappage program, how much that involved in terms of public investment and if it was concentrated in LEZ cities.
    * I can see the changes in vehicles from the PDF database and if I have some complementary info on the scrappage program, I might estimate the expenditure per city and control for it.
    * This might involve changing the control pool

### Scrappage Program's details:

* Part of a group of similar programs around the world in 22 countries 2008-2010. It was the biggest (€5Bilion, Japan €2.9b and the US €2b)
* 61€ per capita in GER
* Timing: Announcement of idea: 27 dec. 2008. Becomes 2 weeks latter. Starts on January 14 2009. Points published Jan 16. Applications were possible until September 2, 2009.
* Size: 2500€ for each old car (older than 9 years, licenced for 12 months) to buy a new one (that had at least the Euro 4 standard and was licensed to the claimant - "Actually, for the German case, this prerequisite was redundant since all new cars bought in 2009 were Euro 4 equipped anyway."). 2 million cars were subsidized.
* Effects (timing and size)
* Data:
  * Passenger cars, by[ age](https://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=road_eqs_carage&lang=en)/ country, [(more data)](https://ec.europa.eu/eurostat/web/transport/data/database)
  * Co2/new passanger cars [data](https://www.eea.europa.eu/data-and-maps/data/co2-cars-emission-16)
  * 

#### Which predictors to use?  

Notes:

* I need city-level data for each one of treated and control regions
* Important to test their balance, not that much for actual estimation?

For GDP:

* Usual GDP predictors:
  * Investment, Education level, Industry share, GDP-per-capita
* New (subject-specific) Predictors
  * :bulb: Public expenditure! (look at OECD data)
    * Is this total or local?
  * Car use (Uber?, Eurostat?, )
  * Types of cars (Long PDF - Wolff(2013) data)

For $\text{Productivity}: $ $\frac{GDP}{\text{Hours Worked}}$:

* GDP/capita
* Investment/capita
* Wage levels or income levels
* Usual nº of hours worked (France Vs All others)
* Share of Men or women in the work market
* Educational level
* Car use
* Types of cars

For absenteeism / temporality: $\frac{\text{Hours Worked}}{\text{Employed Pop.}}$

* Share of Men or women in the work market
* Share of households with elders / children
* Investment/capita
* Wage levels or income levels

For Employment: $\frac{\text{Employed Pop.}}{\text{Working Age Pop.}}$

* Investment/capita
* Wage levels or income levels
* mean age

For proportion of working age population  $\frac{\text{Working Age Pop.}}{\text{Total Pop.}}$

* Mean age
* Mortality and birth rate
* *(look at who gets more affected by pollution mortality)*

For $\text{Population}$:

* Life expectancy
* Proportion of elderly population
* *(look at who gets more affected by pollution mortality)*

## :question: Questions to solve: 

### 1 - Is this a "Sizable" effect?



### 2 - How convincing this really is?



## Additional questions:

* Does the national German legislation says what to do with the funds generated from the LEZ?
* What are the relative sizes of German LEZ? Relative to their city?