# Cover-crop-multiservices
Data and R code for "Optimizing cover crop practices as a sustainable solution towards synergistic promotion of multiple agroecosystem services worldwide"

Tianyi Qiu, Yu Shi, Josep Peñuelas, Ji Liu, Qingliang Cui, Jordi Sardans, Feng Zhou, Longlong Xia, Weiming Yan, Shuling Zhao, Shushi Peng, Jinshi Jian, Qinsi He, Wenju Zhang, Min Huang, Wenfeng Tan, Linchuan Fang

The practice of cover crops (CCs) in agriculture has gained significant popularity as a strategy to improve agricultural sustainability. Yet, its full potential is often constrained by environmental trade-offs stemming from improper use and management. By applying meta-analytic approaches and data-driven quantifications based on 2302 field observations, we aim to optimize the portfolio of CC rotation systems and quantify its benefits for global agroecosystems. Historically, CCs have been shown to increase crop yields, soil carbon storage, and stability, while also stimulating greenhouse gas emissions. However, CCs can be effectively combined with long-term implementation (≥ 5 years) and climate-smart management practices (e.g., no-tillage) to enhance all these services simultaneously. Among various CC types, a biculture of legume and non-legume CCs is recommended, with an optimal termination of approximately 25 days before planting the next crop, followed by CC residue mulching. Such optimized CC practices are projected to globally enhance agroecosystem multiservices by 1.25% under the current scenario (2020). This is equivalent to an annual increase of 97.7 Tg in crop production, 21.7 Pg in CO2 sequestration, and a reduction of 2.41 Pg yr−1 in soil erosion after five years. Looking ahead to 2100, the continued implementation of long-term CC practices is expected to provide consistent resistance to climate-related yield losses and contribute to climate neutrality and soil stabilization, especially in harsh and underdeveloped areas. These findings underscore the promising potential of optimizing CC practices to achieve sustainable development goals, given the synergy in promoting both food security and environmental protection.

All analyses were performed using R statistical software version 4.1.2. Each code can be feasibly run by loading the required packages and reading the correponsding table files. Some large .tif files are deposited in other branchs, such as master and TIF. The average running time for the code is 2.5 minutes.

## AMS and SDG.R
Exploring the relationship between the predicted AMS and national SDG index in 2020

## AMS and micronutrient-new.R
Exploring the relationship between the predicted AMS and soil micronutrient concentrations

## AMS maps-new.R
Mapping the global pattern of AMS and its future trend

## Additional analyses for POC and cellulase.R
Quantifying the effects of long-term CC practices on soil C fractions and cellulase activity

## Agricultural management-new.R
Quantifying the interactions of CCs with agricultural management practices

## CH4 and soil CN-new.R
Exploring the relationship between the change of CH4 and soil C:N ratio

## CMIP6_ISIMIP-new.R
Aggregating and calculating the future climate variables, including temperature, precipitation, and aridity index

## Correlativity between AMS change and climate-new.R
Linking the difference in agroecosystem services and climate change under different scenarios

## Country potential and actual benefits-new.R
Plotting the national-scale CC effects on AMS and individual agroecosystem services

## Crop-specific responses.R
Conducting a premilinary analysis of crop-specific responses to CCs

## Initial SOC and depth interaction.R
Exploring the interaction of initial SOC concentration, pH and depth on the relative change of SOC stocks

## MWD duration-new.R
Exploring the relationship between the response of MWD and CC impelementation duration

## Moving windows-new2.R
Determining the optimal CC termination time with moving window analysis 

## National scaled AMS statistics-new.R
Summarizing the relative and actual effects of CCs in main agricultural countries

## Network analysis-new.R
Calculating the networks and strengths of agroecosystem services in upland and paddy fields

## OptimPars.R
Optimizing parameters and calibrating APSIM model with site data

## Overall effect-new.R
Plotting the overal effect of CC practices on agroecosystem services

## Partial correlation climate and soil-new.R
Determining the independent control of environmental factors over CC effects

## PiecewiseSEM-new2.R
Determining AMS and its underlying mechanisms in upland and paddy fields

## Relative importance-new.R
Identifying the important drivers of individual agroecosystem services

## Root biomass-new.R
Exploring the effect of different CC types on root biomass of cash crops

## SOC and clay interaction-new.R
Determining the mutual control of soil texture and fertility on the changes of crop yields and SOC stocks

## Trend of five services-new.R
Depicting temporal dynamics of individual agroecosystem services
