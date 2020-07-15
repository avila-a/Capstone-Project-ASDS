# Present situation of the MSc final project



#### What I planned to do, current situation and plans for project submission



#### What I planned to do:

* Look how the announcement and implementation of Low Emission Zones affected local GDP  and labour outcomes in each German city that applied it (represented by a NUTS 3 region) see how pollution mediated these effects. Use a large set of European controls to create a synthetic control for each city and estimate the the treatment effects and ATE. Complement this with the effect labor outcomes for NUTS 2 regions.
* Local GDP was highly affected in the financial crisis and had an important confounder: 
  * The German "Scrapage" program of vehicle substitution. It was the biggest in the word (5billion€,  **61€** - 0.15% of GDP - per capita) and lasted from January 2009 to September 2009. It most probably was unequally distributed between cities hat had announced a LEZ and those who had not. 
* So I focused in Labor outcomes that would be less affected by this program (with lower spatial definition). This greatly limited my number of treated units as many NUTS 2 regions include more than one treated or are too big to really consider them as a good representation of the city's outcomes. From 58 LEZ I end up having 7 large cities that I could study, with **only 5** that have a strong dominance of their region.

**Münich NUTS 3 (red) and NUTS 2 (blue)**

<img src="C:\Users\aavil\AppData\Roaming\Typora\typora-user-images\image-20200712101907353.png" alt="image-20200712101907353" style="zoom:67%;" />



* I planned to use MASC, a method being developed by Giovanni Mellace, Alessandra *Pasquini* to estimate the mediating effect of the reduction of pollution caused by LEZ in labor outcomes. Alessandra nicely provided me with the R code and I had to modify it for my purposes.

* **Pollution estimates** (derived from satellite data and weighted by population and GDP rasters) **were too noisy to perform MASC.** Without mediators, there is no added value on performing MASC over other Synthetic Control methods. I decided to leave MASC for this  project and the idea of having an estimation of the mediator effect.

  *Example of values for pollution for a Treated city (M1) and it's synthetic control (w.weight). The high variability does not allow to create a meaningful synthetic control*. Announcement in 2005, implementation in 2010.

  <img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710175447120.png" alt="image-20200710175447120" style="zoom:40%;" />

  *Note: A separate section at the end shows some results in MASC. I continue to think the method and research question are relevant but I don't feel I have the **time** to get data from a different source.*

  

With that in mind, **there was a clear change in sample, outcomes and methodology:**

* **Methodology:**
  * I started to use the *Generalized Synthetic Control Method* (Gsynth) to estimate the effect of LEZ in labor outcomes given it allows for additional controls that the classical SC lacks such as:
    * Unit and time fixed effects,
    * Confidence intervals of treatment effects calculated by a bootstrap procedure.
    * Joint calculation (all treated at once) of the influence of unobserved factors in the outcome, and a Cross-validation procedure to choose how many to include.
    * Weights of control regions can be negative and don't have to add to 1 (less interpretability but more flexibility)
* **Sample:** To review it  I checked the possible sources of endogeneity: There are 3 main limitations to get the causal effect of the policy on the treated (from less to more difficult to control). All of them are documented by previous research.
  * **(1) Anticipation to the policy**  
    * which is fixed using the announcement date. 
  * **(2) Partial spillovers of the policy** (cars go in and out of each city and the policy affects surrounding areas too)
    * Which I control by excluding NUTS regions that have any space in a 30 and 60km radius of a treated city. This highly reduces the number of controls in Germany, Netherlands and Belgium.
  * **(3) Time-variant confounders that act after the announcement of the LEZ** (2006, 2007, 2008, 2009 for my sample). For example when comparing German cities  unemployment with some other European cities, the effect of the financial crisis is clear. 
    * I try to control for the unequal effects of the financial crisis on growth trends by  taking only cities from Germany, Netherlands and Belgium (and maybe Austria) as possible controls. 
    * :exclamation: It's still **impossible** to control for the "Scrappage" program mentioned before for values of growth as some cities received a strong fiscal stimulus, for that reason I restrict the sample to cities that were **announced after** the end of the scrappage program. 
      * For that I already researched the announcement dates of most of LEZ and 29+ are after September 2009 *(black line below)* and looks like a good treated pool. 

        * They are usually small cities that do have sufficient similar-sized controls inside and outside Germany and I have 9+ years of pre intervention period to give confidence that the the pre-intervention paths are parallel.
        * Provisional estimates are usually non-significant until the application of the LEZ. After they show an ATE of 5% decrease in GDP/capita


<img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Present situation of the MSc final project.assets\LEZ application germany_2.png" alt="LEZ application germany_2" style="zoom:72%;" />

#### Current situation



**Title**: The effect of Low Emission Zones in the local economy: A synthetic control approach to German cities.



**Questions**: 

Main question:

* What was the effect of the application of Low Emission Zones (LEZ) on German cities
  economic outcomes and labour market indicators?

Complementary questions: (subject to the adequacy of methods and time constraints)

* Which sectors are more affected by the policy?
* Has it improved labour outcomes for women?
* What would be the effect of a “German” LEZ in other German or European cities that have
  not applied it? *(probably won’t have time but I think it could be of great value)*



**Outcomes**:

1. The effect of LEZ in small cities' aggregate output (after the end of the Scrappage program)

   * Selection criteria for treated and control

   * Justify why I believe a causal effect can be derived from this estimates (no major shocks + over 7 years of pre-treatment period)
   * GDP per capita
   * GDP per worker
   * Proportion of GDP of selected sectors
     * Retail
     * Transport
     * Public
2. The effect of large LEZ on Labor outcomes (big cities, with outcomes that should not be affected by the scrappage program, and based on NUTS2 regions)

   * Selection criteria for treated and control

   * $\frac{\text{Woman in active population}}{\text{Men in active population}}$ *(any positive effect for women?)*
   * Employment proportion of relevant sectors
     * Retail sector *(does it decrease?)*
     * Transport sector  *(does it decrease?)*
     * Public sector *(does in increase?)*
3. The potential effect of a LEZ in cities that have not applied it



#### **Structure** (*This is just a tentative index*):

1. Introduction 

   1. Reasons for LEZ (Pollution -> health -> legislation -> objective is to reduce pollution)
      * Explain prevalence of pollution, sources and relation with road traffic
      * Explain the institutional background of LEZ, why are they applied and how they are applied in Germany
   2. Economic critiques of LEZ (Economy, Investment, )
      * Economic theory of suboptimal allocation and externalities
      * Examples of  critiques (studies and opinions from newspapers)
   3. Why and how (literature) a LEZ can improve the economy? (theory of change)
      * (1) Less congestion, less pollution, less health costs creates...
      * Less mortality, more productivity, better cognitive performance, less absenteeism.
        * Less absenteeism especially in women
   4. My question, does this apply to LEZ? Which effect prevails?
      * Explain the major confounding factor: the application of the scrappage program

2. Data Sources 

   1. Y, X: Eurostat
   2. Treatment status of every European city: Ministry of environment, historical documents and scrapped webpages.

3. Analysis techniques

   1. Generalized Synthetic Control Method

      1. Characteristics, reasons to choose model and how do I control for confounders
      2. The effect of LEZ in small cities' aggregate output (after the end of the Scrappage program)

         * Selection criteria for treated and control

         * Justify why I believe a causal effect can be derived from this estimates (no major shocks + over 7 years of pre-treatment period)
         * GDP per capita
         * GDP per worker
         * Proportion of GDP of selected sectors
           * Retail
           * Transport
           * Public
      3. The effect of large LEZ on Labor outcomes (big cities, with outcomes that should not be affected by the scrappage program)

         * Selection criteria for treated and control

         *  $\frac{\text{Woman in active population}}{\text{Men in active population}}$ *(any positive effect for women?)*
         * Employment proportion of relevant sectors
           * Retail sector *(does it decrease?)*
           * Transport sector  *(does it decrease?)*
           * Public sector *(does in increase?)*
      4. The potential effect of a LEZ in cities that have not applied it. *(if I have time)*
         * My proposal for an "inverse synthetic control method"

4. Results

   * *Presented in such a way we the general ATE is the main result.*
   * *We then see the specific treated and synthetic control for some regions that are of special importance or act as good examples*.
     * *The pre-intervention placebo*
     * *Treatment effect*
     * *Map of control regions by weight*

   1. The effect of large LEZ on Labor outcomes
   2. The effect of LEZ in small cities' aggregate output
      * Explain that GDP $\neq$ aggregate utility and having less pollution is surely valuable
   3. Results for the "inverse synthetic control method" for one or two example cities. *(if I have time)*

5. Conclusions

   1. Summarize, conclude, further research (mention MASC and possibility of doing mediation analysis)

6. Annexes:

   1. Data sources
   2. Results for specific cities
   3. Implementation on LEZ in Germany  (with announcement date)
4. NUTS2 and 3 regions for Germany and Europe
   



#### **Example of presentation of results:**

For the cities of Magdeburg (eastern rural Germany with a very clear dominance on their NUTS 3 region) and Siegen (Western rural Germany, close to Köln and a very minor dominance over theirs). The outcome variable is local aggregate GDP/capita (€).

![image-20200715105736718](C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Present situation of the MSc final project.assets\image-20200715105736718.png)

#### Other topics to discuss:

2. For COVID and other issues an extension period was granted for 10 working days (so the submission date is the 20th of August and not the 6th. I plan to finish it on the weekends.





*End*