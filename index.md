---
title       : An Introduction to R
subtitle    : 
author      : Dan Martin
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
github:
  user: dpmartin42
  repo: R-Intro
---

## Overview

1. What is R?

2. Basic Commands

3. Cleaning

4. Plotting

5. Reproducible Research 

--- 

## What is R


Available at http://cran.r-project.org

* A statistical language
* A programming language
* Object-oriented
  * everything is an object in R

--- 

## Why use R?

* It's free!
* It's open source
  * You can see, re-use, and modify code as needed
* It's flexible
* Access to > 5000 packages
* Can easily create data products

--- 

## Why use R?

* Look like a wizard

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


---

## A major con...

* It's tough!

My goal today is to focus on *your* needs as applied researchers

--- 

## Some useful R packages for reference

* Any type of general linear model: Base
* Logistic Regression: glm
* Structural equation modeling: OpenMx, lavaan
* Multi-level models: lme4, nlme
* Latent Class/Profile Analysis: poLCA, mClust
* Survey Weights: survey
* Propensity Scores: Matching, MatchIt
* Multiple Imputation: mice
* Graphics: ggplot

--- 

## Some helpful R resources for reference

* google!
* [R-bloggers](http://www.r-bloggers.com/)
* [Stack Overflow](http://stackoverflow.com/)
* [Quick-R](http://www.statmethods.net/)
* [An R tutorial](http://www.cyclismo.org/tutorial/R/)
* [A ggplot2 tutorial](http://www.ling.upenn.edu/~joseff/avml2012/)

--- 

## R Examples: Shiny

[SPR Cup Global Health Project](https://dpmartin42.shinyapps.io/App-1/)

[Dialect Maps](http://spark.rstudio.com/jkatz/SurveyMaps/)

--- 

## R Examples: googleVis

<!-- MotionChart generated in R 3.1.1 by googleVis 0.5.3 package -->
<!-- Tue Jul 15 16:40:15 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID126d940c5c3d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Apples",
new Date(2008,11,31),
2008,
"West",
98,
78,
20 
],
[
 "Apples",
new Date(2009,11,31),
2009,
"West",
111,
79,
32 
],
[
 "Apples",
new Date(2010,11,31),
2010,
"West",
89,
76,
13 
],
[
 "Oranges",
new Date(2008,11,31),
2008,
"East",
96,
81,
15 
],
[
 "Bananas",
new Date(2008,11,31),
2008,
"East",
85,
76,
9 
],
[
 "Oranges",
new Date(2009,11,31),
2009,
"East",
93,
80,
13 
],
[
 "Bananas",
new Date(2009,11,31),
2009,
"East",
94,
78,
16 
],
[
 "Oranges",
new Date(2010,11,31),
2010,
"East",
98,
91,
7 
],
[
 "Bananas",
new Date(2010,11,31),
2010,
"East",
81,
71,
10 
] 
];
data.addColumn('string','Fruit');
data.addColumn('date','Date');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID126d940c5c3d() {
var data = gvisDataMotionChartID126d940c5c3d();
var options = {};
options["width"] =    550;
options["height"] =    350;

    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID126d940c5c3d')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID126d940c5c3d);
})();
function displayChartMotionChartID126d940c5c3d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID126d940c5c3d"></script>
 
<!-- divChart -->
  
<div id="MotionChartID126d940c5c3d" 
  style="width: 550; height: 350;">
</div>


---

## R Examples: googleVis

<!-- GeoChart generated in R 3.1.1 by googleVis 0.5.3 package -->
<!-- Tue Jul 15 16:40:15 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID126d9477baade () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Alabama",
2.1 
],
[
 "Alaska",
1.5 
],
[
 "Arizona",
1.8 
],
[
 "Arkansas",
1.9 
],
[
 "California",
1.1 
],
[
 "Colorado",
0.7 
],
[
 "Connecticut",
1.1 
],
[
 "Delaware",
0.9 
],
[
 "Florida",
1.3 
],
[
 "Georgia",
2 
],
[
 "Hawaii",
1.9 
],
[
 "Idaho",
0.6 
],
[
 "Illinois",
0.9 
],
[
 "Indiana",
0.7 
],
[
 "Iowa",
0.5 
],
[
 "Kansas",
0.6 
],
[
 "Kentucky",
1.6 
],
[
 "Louisiana",
2.8 
],
[
 "Maine",
0.7 
],
[
 "Maryland",
0.9 
],
[
 "Massachusetts",
1.1 
],
[
 "Michigan",
0.9 
],
[
 "Minnesota",
0.6 
],
[
 "Mississippi",
2.4 
],
[
 "Missouri",
0.8 
],
[
 "Montana",
0.6 
],
[
 "Nebraska",
0.6 
],
[
 "Nevada",
0.5 
],
[
 "New Hampshire",
0.7 
],
[
 "New Jersey",
1.1 
],
[
 "New Mexico",
2.2 
],
[
 "New York",
1.4 
],
[
 "North Carolina",
1.8 
],
[
 "North Dakota",
0.8 
],
[
 "Ohio",
0.8 
],
[
 "Oklahoma",
1.1 
],
[
 "Oregon",
0.6 
],
[
 "Pennsylvania",
1 
],
[
 "Rhode Island",
1.3 
],
[
 "South Carolina",
2.3 
],
[
 "South Dakota",
0.5 
],
[
 "Tennessee",
1.7 
],
[
 "Texas",
2.2 
],
[
 "Utah",
0.6 
],
[
 "Vermont",
0.6 
],
[
 "Virginia",
1.4 
],
[
 "Washington",
0.6 
],
[
 "West Virginia",
1.4 
],
[
 "Wisconsin",
0.7 
],
[
 "Wyoming",
0.6 
] 
];
data.addColumn('string','state.name');
data.addColumn('number','Illiteracy');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID126d9477baade() {
var data = gvisDataGeoChartID126d9477baade();
var options = {};
options["width"] =    550;
options["height"] =    350;
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID126d9477baade')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID126d9477baade);
})();
function displayChartGeoChartID126d9477baade() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID126d9477baade"></script>
 
<!-- divChart -->
  
<div id="GeoChartID126d9477baade" 
  style="width: 550; height: 350;">
</div>


---

## OK! Before we get started...

1. Download the latest version of R for your operating system
2. Install R Studio
3. Download the materials from https://github.com/dpmartin42/R-Workshop



