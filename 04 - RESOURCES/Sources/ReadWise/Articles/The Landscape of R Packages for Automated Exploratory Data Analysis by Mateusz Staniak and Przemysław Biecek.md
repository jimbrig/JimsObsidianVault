---
Date: 2023-06-13
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Source: reader
Link: https://arxiv.org/pdf/1904.02101.pdf
Tags:
  - "#Type/Highlight/Article"
Aliases:
  - The Landscape of R Packages for Automated Exploratory Data Analysis by Mateusz Staniak and Przemysław Biecek
  - The Landscape of R Packages for Automated Exploratory Data Analysis by Mateusz Staniak and Przemysław Biecek
---
# The Landscape of R Packages for Automated Exploratory Data Analysis by Mateusz Staniak and Przemysław Biecek

## Metadata
- Author: [[arxiv.org]]
- Full Title: The Landscape of R Packages for Automated Exploratory Data Analysis by Mateusz Staniak and Przemysław Biecek
- Category: #Type/Highlight/Article
- Document Tags: [[coding]] 
- URL: https://arxiv.org/pdf/1904.02101.pdf

## Highlights
- There is a growing number of libraries that attempt to automate some of the typical Exploratory Data Analysis tasks to make the search for new insights easier and faster. In this paper, we present a systematic review of existing tools for Automated Exploratory Data Analysis (autoEDA). We explore the features of fifteen popular R packages to identify the parts of the analysis that can be effectively automated with the current tools and to point out new directions for further autoEDA development. ([View Highlight](https://read.readwise.io/read/01gtx2acry0srdkj7gyzgv92km))
- Yet, model building is always preceded by a phase of understanding the problem, understanding of a domain and exploration of a data set. Usually, in the process of the data analysis much more time is spent on data preparation and exploration than on model tuning. This is why the current bottleneck in data analysis is in the exploratory data analysis (EDA) phase. Recently, a number of tools were developed to automate or speed up the part of the summarizing data and discovering patterns. Since the process of building predictive models automatically is referred to as autoML, we will dub the automation of data exploration autoEDA. The surge in interest in autoEDA tools1 is evident in the Figure 1. Table 1 describes the popularity of autoEDA tools measured as the number of downloads from CRAN and usage statistics from Github2. ([View Highlight](https://read.readwise.io/read/01gtx2anetgr30sgyqmhxntm7w))
- Here, we make a first attempt to comprehensively describe R tools for autoEDA. We chose two types of packages. The first group explicitly aims to automate EDA, as stated in the description of the package. These includes packages for fast, easy, interactive or automated data exploration. The second group contains packages that create data summaries. ([View Highlight](https://read.readwise.io/read/01gtx2bs4xtcs5gd33rkmbq33k))
- me of the more task-specific packages are briefly discussed in Section 2.2.16. Some packages, such as radiant ([View Highlight](https://read.readwise.io/read/01gtx2c9p7nbe0zramsacxaq9q))
- This paper has two main goals. First is to characterize existing R packages for automated Ex- ploratory Data Analysis and compare their ranges of capabilities. To our best knowledge, this is first such a review. Previously, a smaller comparison of seven packages was done in Putatunda et al. (2019). Second is to identify areas, where automated data exploration could be improved. In particular, we are interested in gauging the potential of AI-assisted EDA tools. ([View Highlight](https://read.readwise.io/read/01gtx2cd8at7s2y7pqw1j259y1))
- summarytools (84737)
  DataExplorer (82624)
  visdat (68978)
  funModeling (54232)
  arsenal (39234)
  dataMaid (23972)
  dlookr (13268)
  RtutoR (10502)
  xray (8300) ([View Highlight](https://read.readwise.io/read/01gtx2ddvp1mscm0jnjrvrp3st))
- exploreR (8112) ([View Highlight](https://read.readwise.io/read/01gtx2dfqwppc7yx89aq713t0c))
- ExPanDaR (5713) ([View Highlight](https://read.readwise.io/read/01gtx2dk57s7daxc7w610drbgn))
- SmartEDA (5150) ([View Highlight](https://read.readwise.io/read/01gtx2dhwgwvtykast53rg3ahc))
- inspectdf (3252) ([View Highlight](https://read.readwise.io/read/01gtx2dyzfwa2770aek3k6m1xk))
- explore (808) ([View Highlight](https://read.readwise.io/read/01gtx2dxprd0082cnj1yr5h5vb))
- The tasks of Exploratory Data Analysis
  Exploratory Data Analysis is listed as an important step in most methodologies for data analysis (Biecek, 2019; Grolemund and Wickham, 2019). One of the most popular methodologies, the CRISP-DM (Wirth, 2000), lists the following phases of a data mining project:
  1. Business understanding.
  2. Data understanding.
  3. Data preparation.
  4. Modeling.
  5. Evaluation.
  6. Deployment. ([View Highlight](https://read.readwise.io/read/01gtx2ekfwhh4dnxwvebbz6w13))
- Each task should be summarised in a report, which makes reporting another relevant problem of autoEDA. Uni- and bivariate data exploration is a part of the analysis that is most thoroughly covered by the existing autoEDA tools. The form of univariate summaries depends on the variable type. For numerical variables, most packages provide descriptive statistics such as centrality and dispersion measures. For categorical data, unique levels and associated counts are reported. Bivariate relationships descriptions display either dependency between one variable of interest and all other variables, which includes contingency tables, scatter plots, survival curves, plots of distribution by ([View Highlight](https://read.readwise.io/read/01gtx2eteeydth639b1a54snmw))
