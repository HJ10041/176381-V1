OVERVIEW

The programs and data in this replication package create Figure 1, 2, and 3 in Cochrane (2022), "Fiscal Histories." 
This archive is also available at johnhcochrane.com  

inflation_persist_program.m  is a matlab program to produce the simulation of Figure 1

JEP_plots.m  is a matlab program to produce data plots of Figure 2 and Figure 3. 

*.csv are data files

The programs should run in 10 seconds or less. The programs expect the data files to be in the same directory.  

DATA AND CODE AVAILABILITY STATEMENT

Code and data are included in this package. The data are all downloaded from https://fred.stlouisfed.org. They are all publicly available series published by U.S. government agencies.

SOFTWARE REQUIREMENTS

The matlab programs need matlab. No optional packages are used. I ran them on Matlab R2020b Update 3 (9.9.0.1538559) 64-bit (maci64) November 23, 2020, under macOS Monterey version 12.5

DATA AVAILABILITY AND PROVENANCE

All data are downloaded from https://fred.stlouisfed.org and the format, but not the numers, is modified so that matlab can read them: I changed dates from 01-01-2000 to 01,01,2000, and added comments lines % at the top to document each file.

I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript.

All data are publicly available. 

DETAILS ON EACH DATA FILE 

Data Citations are included in the header files of each *.csv. All in one place, here they are

A091RC1Q027SBEA.csv
U.S. Bureau of Economic Analysis, Federal government current expenditures: Interest payments [A091RC1Q027SBEA], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/A091RC1Q027SBEA, July 25 2022.

AD02RC1Q027SBEA.csv
U.S. Bureau of Economic Analysis, Net lending or net borrowing (-), NIPAs: Government: Federal [AD02RC1Q027SBEA], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/AD02RC1Q027SBEA, July 25, 2022.

FEDFUNDS.csv
Board of Governors of the Federal Reserve System (US), Federal Funds Effective Rate [FEDFUNDS], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/FEDFUNDS, July 25, 2022.

UNRATE.csv
U.S. Bureau of Labor Statistics, Unemployment Rate [UNRATE], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/UNRATE, July 25, 2022.

GDPDEF.csv
U.S. Bureau of Economic Analysis, Gross Domestic Product: Implicit Price Deflator [GDPDEF], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/GDPDEF, July 25, 2022.

CPILFE.csv
U.S. Bureau of Labor Statistics, Consumer Price Index for All Urban Consumers: All Items Less Food and Energy in U.S. City Average [CPILFESL], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/CPILFESL, July 25, 2022.

GDPC1.csv
U.S. Bureau of Economic Analysis, Real Gross Domestic Product [GDPC1], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/GDPC1, July 25, 2022.

 
LIST OF FIGURES AND PROGRAMS

Figure 1: inflation_persist_program.m 
Figure 2: JEP_plots.m
Figure 3: JEP_plots.m

IN-TEXT NUMBERS 

"the top personal marginal tax rate fell from 70 percent to 28 percent"
Tax Policy Center. 2022. "Historical Highest Marginal Income Tax Rates" Tax Policy Center. February 9 2022. https://www.taxpolicycenter.org/statistics/historical-highest-marginal-income-tax-rates. Accessed August 15 2022

"trend real GDP was 37 percent larger in 2000 than in 1980"
Calculation in JEP_plots.m

"investors who bought 10-year bonds at 15 percent yield in 1980,"
Board of Governors of the Federal Reserve System (US), Market Yield on U.S. Treasury Securities at 10-Year Constant Maturity, Quoted on an Investment Basis [DGS10], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/DGS10, August 15, 2022.

"Long-term projections from the Congressional Budget Office point to steady primary deficits of roughly 5 percent of GDP,"
Congressional Budget Office, 2022. "The long-term budget outlook." (July 27 2022) https://www.cbo.gov/publication/57971 Accessed August 15 2022.

"The deficit widened dramatically, from 1.1 percent of GDP in 2007 to 9.8 percent, 8.6 percent, and 8.3 percent in 2009–2011."
U.S. Office of Management and Budget and Federal Reserve Bank of St. Louis, Federal Surplus or Deficit [-] as Percent of Gross Domestic Product [FYFSGDA188S], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/FYFSGDA188S, July 25, 2022.

"Inflation as measured by the Consumer Price Index fell, from a peak of 5.5 percent in July 2008 (at an annualized rate) to 2 percent deflation in July 2009. Inflation
stayed below 2 percent for the rest of the decade."
"Inflation rose suddenly in early 2021, reaching 9 percent by June 2022."
U.S. Bureau of Labor Statistics, Consumer Price Index for All Urban Consumers: All Items in U.S. City Average [CPIAUCSL], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/CPIAUCSL, July 25, 2022. Percent change from a year ago.

"Japan has a debt to GDP ratio of over 200 percent"
International Monetary Fund, General government gross debt for Japan [GGGDTAJPA188N], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/GGGDTAJPA188N, August 16, 2022.

"a banking crisis led to a disastrous nearly 30 percent cumulative deflation."
National Bureau of Economic Research, Consumer Price Index, All Items for United States [M04128USM350NNBR], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/M04128USM350NNBR, August 16, 2022.

"Bank reserves held at the Fed rose from roughly $10 billion in 2007 to over $2,700 billion by August 2014, a 27,000 percent increase."
Board of Governors of the Federal Reserve System (US), Liabilities and Capital: Other Factors Draining Reserve Balances: Reserve Balances with Federal Reserve Banks: Week Average [WRESBAL], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/WRESBAL, August 16, 2022.

"The federal funds interest rate fell from 5.25 percent in July 2008 to effectively zero, less than 0.25 percent, and stayed there until 2016."
Board of Governors of the Federal Reserve System (US), Federal Funds Effective Rate [FEDFUNDS], retrieved from FRED, Federal Reserve Bank of St. Louis; https://fred.stlouisfed.org/series/FEDFUNDS, July 25, 2022.

"the $1.9 trillion “American Rescue Plan,” 
Congressional Budget Office. 2021. "Estimated Budget Effects of the American Rescue Plan Act of 2021." Feburary 20, 2021.  https://www.cbo.gov/publication/57012. Accessed August 16 2022.


REFERENCES

Cochrane, John H. 2022. "Fiscal Histories" Journal of Economic Perspectives, forthcoming.

