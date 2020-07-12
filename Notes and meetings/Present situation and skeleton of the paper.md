# Present situation and skeleton of the MSc final project

#### What I planned to do, current situation and plans for project submission



###### What I planned to do:

* Have local GDP (outcomes) and average pollution (mediator) in each German city that applied a Low Emission Zone city (represented by a NUTS 3 region). Use a large set of European controls to create a synthetic control for each city and estimate the the treatment effects and ATE. Complement this with the effect labor outcomes for NUTS 2 regions.
* Local GDP was highly affected in the financial crisis and had important confounders, so I focused in Labor outcomes (with lower spatial definition). This greatly limited my number of treated units as many NUTS 2 regions include more than one treated or are too big to really consider them as a good representation of the city's outcomes. From 58 LEZ I end up having 7 large cities that I could study, with only 5 that have a strong dominance of their region.

**Münich NUTS 3 (red) and NUTS 2 (blue)**

<img src="C:\Users\aavil\AppData\Roaming\Typora\typora-user-images\image-20200712101907353.png" alt="image-20200712101907353" style="zoom:67%;" />



* I planned to use MASC, a method being developed by Giovanni Mellace, Alessandra *Pasquini* to estimate the mediating effect of the reduction of pollution caused by LEZ in labor outcomes. Alessandra nicely provided me with the R code and I had to modify it for my purposes.

* **Pollution estimates** (derived from satellite data and weighted by population and GDP rasters) **were too noisy to perform MASC.** Without mediators, there is no added value on performing MASC over other Synthetic Control methods. I decided to leave MASC for this  project and the idea of having an estimation of the mediator effect.

  *Example of values for pollution for a **Treated** city (M1) and it's synthetic control (w.weight). The high variability does not allow to create a meaningful synthetic control*

  <img src="C:\Users\aavil\OneDrive\Documentos\A - Estudios\LSE_ASDS\Project\Capstone-Project\Notes and meetings\Notes on capstone project.assets\image-20200710175447120.png" alt="image-20200710175447120" style="zoom:40%;" />

  *Note: A separate section at the end shows some results in MASC. I continue to think the method and research question are relevant but I don't feel I have the **time** to get data from a different source.*

* With that in mind, there was a clear change in questions and methodology:

  * Questions:
    * Does LEZ affect labor outcomes? 
      * Past research has suggested woman labor outcomes are more affected by pollution given they usually take care of vulnerable population (old and young) ¿Can I find some evidence of that? 
      * Are sectors that have actively criticized LEZ (such as retail) especially affected by this policy?.
  * Methodology:
    * I started to use the Generalized Synthetic Control (Gsynth) to estimate the effect of LEZ in labor outcomes given it allows for additional controls that the classical SC lacks such as:
      * Unit and time fixed effects (especially important when looking at labor outcomes affected by the financial crisis),
      * Confidence intervals of treatment effects calculated by a bootstrap procedure.
      * Joint calculation (all cities/NUTS at once) of the influence of unobserved factors in the outcome, and a Cross-validation procedure to choose how many to include.
      * Weights of control regions can be negative and don't have to add to 1 (less interpretability but more flexibility)

* I am now looking at the effect of LEZ in various outcomes (and there are some **preliminary** results)

  * Unemployment (total and women's unemployment)
    * No changes after announcement, sharp declines after implementation (3-5% less), smaller and sooner effect for female unemployment (1-3% less) (contrary to intuition)
  *  $\frac{\text{Woman in active population}}{\text{Men in active population}}$ 
    * Looks like there is no changes after announcement and then a decline of 3% after implementation, (contrary to intuition)
  * Wages/worker
    * No treatment effect in any city.
  * Proportion of employed population in each sector (especially tourism/retail and public administration)
    * No overall effect in retail overall (looks negative in touristic cities and positive for Hannover - a central German city)
    * No overall effect in public sector share of employment