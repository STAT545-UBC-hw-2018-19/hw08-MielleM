README
================
MielleM
11/15/2018

Welcome to the repository for MielleM's homework assignment \#8 in the STAT 547 course at UBC.

Click [here](https://miellem.shinyapps.io/bclapp/) to check out my shiny app using BC Liquor stores data.

This repository holds the code for [my](https://github.com/MielleM) BCL shiny app, which I modified from [here](https://github.com/STAT545-UBC-students/hw08-seed), originally developed by [Dean Attali](https://deanattali.com/blog/building-shiny-apps-tutorial/). The original data was sourced from [DataBC](https://data.gov.bc.ca/).

My modifications:

-   made table interactive using `DT` package
-   add a checkbox to allow the user to filter by country
-   Added BCL logo to the side panel
-   spruce up graph a bit using `ggplot()`
-   altered app to allow user to filter for multiple alcohol types at the same time. *Despite the option always appearing, this only works if a country is selected!*

<table style="width:18%;">
<colgroup>
<col width="8%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th>File</th>
<th>About</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>README.md</td>
<td>Introduction and orientation to contents of MielleM hw08 repo (you're here right now, so I'm not going to link it)</td>
</tr>
<tr class="even">
<td><a href="https://github.com/STAT545-UBC-students/hw08-MielleM/blob/master/app.R">app.R</a></td>
<td>R file containing my modified BCL app</td>
</tr>
<tr class="odd">
<td><a href="https://github.com/STAT545-UBC-students/hw08-MielleM/blob/master/bcl-data.csv">bcl-data.csv</a></td>
<td>.csv containing BCL data that this app is based on</td>
</tr>
</tbody>
</table>
