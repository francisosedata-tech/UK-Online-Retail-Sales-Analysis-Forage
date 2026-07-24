# UK Online Retail Sales & Growth Analysis 


![UK Retail Sales Dashboard](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/blob/1964efbae863e6c1d794a54bd14c80f777e4c6be/Screenshots/UK%20retail%20sales%20dashboard.png)

## 📌 Overview
An end-to-end sales analysis project on transactional data from a UK-based 
online retailer, built as part of the **Tata Forage Data Visualization Job 
Simulation**. SQL was used for exploratory data analysis, with findings 
visualized in an interactive Power BI dashboard tailored to stakeholder 
needs (CEO and CMO personas).


## 🎯 Objective
Explore and visualize the data to answer real business questions:
- How does revenue trend month-over-month, and what seasonal patterns exist?
- Which countries and customers generate the most revenue (excluding the UK)?
- Which products sell best, by both revenue and quantity?
- Where are the strongest opportunities for international expansion?

## 🛠️ Process
1. *Exploratory Data Analysis (SQL)* — queried and profiled the raw dataset 
   to understand structure, clean inconsistencies, and surface initial trends 
   in revenue, customers, and product performance
2. *Dashboard Design (Power BI)* — modeled the data and built interactive 
   visuals to turn findings into stakeholder-ready insights

## 📊 Key Features
- *Revenue trend analysis* — monthly breakdown for 2011 to surface seasonality
- *Top 10 best-selling products* — by sales value and quantity sold
- *Top 10 customers by revenue* — ranked to highlight priority accounts
- *Top revenue-generating countries* (excluding UK) — for market prioritization
- *Geographic demand map* — highlighting expansion opportunities outside the UK
- *KPI cards* — total revenue, customer count, regions covered, YoY growth, UK revenue share

## 🛠️ Tools & Skills
- *SQL* — exploratory data analysis, querying, data cleaning 
- *Power BI* — data modeling, DAX, interactive visuals, slicers/filters
- Data storytelling and dashboard design principles

## 📁 Files
- SQL_Queries/ — exploratory analysis queries [View](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/blob/bf202a881629b1820a25315042bf23427ccf6126/Retaildataset.sql)
- Online_Retail_Dashboard.pbix — Power BI dashboard file [View](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/blob/762d2b4d7de9d6f0d860617bac5f5eb9eeeaf2b3/Online%20Retail%20Project.pbix)
- Dataset — source transactional data [View](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/blob/06582884b54827e302d06a09713d8a91f3130cde/Online%20Retail%20Dataset.xlsx)
- Screenshots/ — dashboard preview images [View](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/tree/160f9e663c188da1a1fc8299c1cad6b7e8773089/Screenshots)
  
## 📄 Full Project Report

### Executive Summary
This report presents an analysis of transactional sales data from a UK-based 
online retailer covering the 2010–2011 period. Exploratory data analysis was 
conducted using SQL to clean, structure, and interrogate the raw dataset, with 
findings visualized in an interactive Power BI dashboard. The objective was to 
identify revenue drivers, seasonal demand patterns, high-value customer 
segments, and international expansion opportunities to support strategic 
decision-making by senior leadership.

The business generated a total of *£10.65M* in revenue across *38 regions*, 
serving *6,528 customers*. The United Kingdom remains the dominant market, 
contributing *85% of total revenue*, while year-over-year sales growth stood 
at *11.92%*. Revenue was heavily concentrated in the final quarter of 2011, 
pointing to a strong and predictable seasonal buying pattern that offers a 
clear opportunity for more targeted forecasting and marketing investment.

### Methodology
Analysis was carried out in two stages. First, *SQL* was used to perform 
exploratory data analysis on the raw transactional dataset (500,000+ rows) — 
profiling record volumes, identifying and handling data quality issues (such 
as cancelled orders and missing customer IDs), and running aggregate queries 
to surface early patterns in revenue, product performance, and customer 
behavior. Second, the cleaned data was modeled in *Power BI*, where DAX 
measures and interactive visuals were built to translate these findings into 
a stakeholder-facing dashboard, tailored to the specific questions posed by 
CEO and CMO personas.

### Key Findings
- *Seasonal revenue concentration:* Monthly revenue held relatively flat 
  between £0.5M–£0.8M from January through September 2011, then climbed 
  sharply to a peak of £1.50M in November. December 2011 shows a sharp drop, 
  but this reflects an *incomplete month of data* rather than an actual 
  decline in demand — the dataset cuts off partway through December. Had a 
  full month of data been available, December would likely have ranked among 
  the strongest months of the year, in line with the pre-holiday buying surge 
  already visible in November.
- *UK market dominance:* The UK accounts for 85% of total revenue, 
  confirming it as the core market, while £1.38M in revenue came from the 
  top 10 countries outside the UK.
- *Leading international markets:* Excluding the UK, the Netherlands, EIRE 
  (Ireland), and Germany generated the highest revenue, followed by France 
  and Australia — indicating concentrated demand in Western Europe.
- *Top-performing products:* Best sellers by revenue included the Regency 
  Cakestand 3 Tier, Paper Craft Little Birdie, and the White Hanging Heart 
  T-Light Holder, with Jumbo Bag Red Retrospot and Medium Ceramic Top Storage 
  Jar leading by quantity sold.
- *High-value customers:* A small group of customers contributes 
  disproportionately to revenue, with the top customer generating over £280K 
  — highlighting a clear opportunity for targeted retention efforts.
- *Expansion potential:* Geographic demand mapping (excluding the UK) 
  highlights clusters of activity across Western Europe and pockets of 
  demand in North America and Australia, suggesting realistic near-term 
  targets for international growth.

### Recommendations
- *Plan for Q4 seasonality:* Align inventory, staffing, and marketing 
  spend with the sharp October–November demand spike, and account for 
  December's likely full-month potential (understated in this dataset) 
  when forecasting for 2012.
- *Prioritize European expansion:* Invest in targeted marketing and 
  localized logistics in the Netherlands, Ireland, and Germany, where 
  demand is already established outside the UK.
- *Launch a loyalty program for top customers:* Protect and grow revenue 
  from the highest-spending customer segment through personalized offers 
  and retention campaigns.
- *Double down on proven bestsellers:* Ensure consistent stock 
  availability for top-performing products such as the Regency Cakestand 
  and White Hanging Heart T-Light Holder, which show strong demand across 
  both revenue and volume.
- *Monitor emerging markets:* Track early demand signals in North America 
  and Australia to evaluate them as second-phase expansion targets.

### Conclusion
The data points to a business with a strong, stable UK core and clear, 
data-backed opportunities for controlled international growth. By combining 
SQL-driven exploratory analysis with an interactive Power BI dashboard, this 
project translated raw transactional data into insights that map directly 
onto strategic decisions around forecasting, customer retention, and market 
expansion.

## 🎓 Certification
Completed as part of the Tata Forage Data Visualization Job Simulation. [View Certificate](https://github.com/francisosedata-tech/UK-Online-Retail-Sales-Analysis-Forage/tree/65f0fa4151014c4d6be424934d7cb0f7c39d3a23/Certificate)
