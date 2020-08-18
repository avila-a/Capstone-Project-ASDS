This repository includes all major work done for the capstone project of the MSc in Applied Social Data Science from LSE. 
In that sense, it not only includes the files needed to run the final analysis but it includes almost all analysis done in the research process.

#### Notes:
+ Some methods and code that include non-public work from other researchers are not included.
+ Some large files are not included for lack of space but can be retreived with the code provided.
+ Almost all code files come toguether with an html file that has all the results rendered from the last time they were runned

## Guide on the repository:

* Final text with bases, analysis and results can be found at `Presentations and documents/Capstone_project__German_LEZ.pdf`

###  Main sources of data:
  + Data on GDP and economic controls comes from Eurostat. This is downloaded with the `Download Eurostat.Rmd` file.
  + Data on the treatment status of German and European region was gathered from two sources:
    - The German Entironment Agency (in `data/umweltbundesamt/umweltzonen`)
    - The urbanaccessregulations.eu/ website and the `Green Zones` app (extracted in `Unparse UAR php.Rmd`)
  + Extra data for the actual geographies of LEZ for some cities was gathered from the Open Street Map Servers in the file `Download LEZ OSM.Rmd`
  + Non-strictly spatial data is aggregated by time and NUTS3 region in a SQL database on `create SQL db.Rmd`


### Main analysis code, after downloading the data:
  + First analysis were performed in `Analysis LEZ 2.Rmd` with multiple methodologies.
  + Final analysis with the Generalized Synthetic Control Method are coded in `Analysis Gsynth n3.Rmd` 
  + Geospatial manipulation to construct a well defined control pool is in `Unparse UAR php.Rmd`,


### Results:
  + Images of results, robustness tests and diagnostics displayed on the main document are found in `images/prelim_results`
  + Other context images are simply on the `images/` folder.
  + Interactive maps are also available:
    - `policy_map.html` displays the data from The urbanaccessregulations.eu/ website and the `Green Zones` app. [link](/htmlpages/policymap)
    - `map_tr_and_controls_.html` Shows the treatment and control NUTS3 regions with their details and ids.
  
## Extras, not included in the main text:
  + Unfinished code to gather air pollution data for almost all public available air quality stations in Europe is in `/Pollution data`
  + Multiple codes where the analysis is done with the MASC method from Mellace and Pasquini (2019). This was not included in 
  the main results as the data for air pollution was too noisy. The code is not available here but feel free to contact me if interested.
  
  For contact and further doubts feel free to add an issue or contact me directly at A.Avila2@lse.ac.uk.
    
  
