
<!-- README.md is generated from README.Rmd. Please edit that file -->

# [vista](https://github.com/asiripanich/vista) 🚶‍♀️🚲🚗🚌

<!-- badges: start -->

[![R-CMD-check](https://github.com/asiripanich/vista/workflows/R-CMD-check/badge.svg)](https://github.com/asiripanich/vista/actions)
<!-- badges: end -->

✨ **Features** ✨

  - Offers `vista_dm`, a [public version of
    VISTA](https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications)
    as a relational data model in R, by leveraging on the
    [{dm}](https://cynkra.github.io/dm/) package.
  - 🚧 (coming soon) Converts VISTA and 1% ABS Census Sample File to
    CVISTA (C here stands for close-enough-to), an intermediate format.

☝️ If you have other versions of VISTA, you can use the `vista_to_dm()`
function to convert your VISTA tables into a {dm} object.

## Installation

You can install the released version of vista from GitHub with:

``` r
install.packages("devtools")
devtools::install_github("asiripanich/vista")
```

## Example

``` r
library(vista)
vista_dm
#> ── Metadata ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Tables: `persons`, `households`, `trips`, `stops`, `jte`, `jtw`
#> Columns: 301
#> Primary keys: 6
#> Foreign keys: 5
```

``` r
library(dm)
vista_dm %>%
  dm_draw()
```

<img src="man/figures/README-vista-dm-draw.png" width="50%" />

``` r
vista_persons_and_households <- vista_dm %>%
            dm_select_tbl(persons, households) %>%
            dm_squash_to_tbl(persons) %>%
            collect() %>%
            data.table::setDT()
head(vista_persons_and_households)
#>            persid        hhid person numstops monthofbirth yearofbirth age    sex relationship         persinc     carlicence mbikelicence otherlicence    nolicence fulltimework
#> 1: Y12H0000101P01 Y12H0000101      1        2        April        1962  50   Male         Self $1000-1249 p.w.   Full Licence            N            N Some Licence            Y
#> 2: Y12H0000101P02 Y12H0000101      2        5      January        1969  43 Female       Spouse     $1-199 p.w.   Full Licence            N            N Some Licence            N
#> 3: Y12H0000101P03 Y12H0000101      3        2         July        2000  11 Female        Child     Zero Income No Car Licence            N            N   No Licence            N
#> 4: Y12H0000101P04 Y12H0000101      4        2       August        2005   6 Female        Child     Zero Income No Car Licence            N            N   No Licence            N
#> 5: Y12H0000102P01 Y12H0000102      1        0      January        1955  57 Female       Spouse     $1-199 p.w.   Full Licence            N            N Some Licence            N
#> 6: Y12H0000102P02 Y12H0000102      2        5         July        1955  56   Male       Spouse   $300-399 p.w.   Full Licence            N            N Some Licence            N
#>    parttimework casualwork anywork studying        activities        mainact          worktype           emptype                                anzsco1             anzsco2
#> 1:            N          N       Y No Study No other activity Full-time Work       Fixed Hours     Paid Employee Community and Personal Service Workers Hospitality Workers
#> 2:            N          N       N No Study     Keeping House  Keeping House Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 3:            N          N       N  Primary No other activity Primary School Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 4:            N          N       N  Primary No other activity Primary School Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 5:            N          N       N No Study           Retired        Retired Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 6:            N          N       N No Study        Unemployed     Unemployed Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#>                                anzsic1                 anzsic2     startplace additionaltravel cycledexercise cycledother cycledshopping cycledwork nocycled disabledtrans
#> 1: Administrative and Support Services Administrative Services Survey address                N              N           N              N          N        Y             N
#> 2:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 3:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 4:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 5:                   Not in Work Force       Not In Work Force Survey address              N/A              N           N              N          N        Y             N
#> 6:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#>    taxitrans wheelchairtrans accesstrans wdperswgt weperswgt survey_period travdow travmonth day_type      dwelltype        owndwell hhsize  hhinc visitors aveage youngest oldest
#> 1:         N               N           N     84.77        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4 $1,225        0     27        6     50
#> 2:         N               N           N     92.98        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4 $1,225        0     27        6     50
#> 3:         N               N           N    100.23        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4 $1,225        0     27        6     50
#> 4:         N               N           N     99.02        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4 $1,225        0     27        6     50
#> 5:         N               N           N     82.61        NA       2012-13 Tuesday       May  Weekday Separate House Being Purchased      4 $1,700        0     40       21     57
#> 6:         N               N           N     85.31        NA       2012-13 Tuesday       May  Weekday Separate House Being Purchased      4 $1,700        0     40       21     57
#>    yearslived monthslived adultbikes kidsbikes totalbikes cars fourwds utes vans trucks mbikes othervehs totalvehs wdhhwgt wehhwgt        homelga home_sub_region home_region
#> 1:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 2:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 3:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 4:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 5:          9           4          0         0          0    3       0    0    0      0      0         0         3   97.00      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 6:          9           4          0         0          0    3       0    0    0      0      0         0         3   97.00      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#>    homepc
#> 1:   3082
#> 2:   3082
#> 3:   3082
#> 4:   3082
#> 5:   3082
#> 6:   3082
cvista <- vista_to_cvista(vista_persons_and_households)
#> ℹ Creating a copy of x
#> ✔ Added the following ID fields hhid and persid to extra_cols.
#> ✔ Added: cvista_age.
#> ✔ Added: cvista_age5_c.
#> ✔ Added: cvista_sex.
#> ✔ Added: cvista_anzsco1.
#> ✔ Added: cvista_anzsic1.
#> ✔ Added: cvista_emptype.
#> ✔ Added: cvista_studying.
#> ✔ Added: cvista_relationship_c.
#> ✔ Added: cvista_dwelltype.
#> ✔ Added: cvista_owndwell_c.
#> ✔ Added: cvista_cars_c.
#> ℹ Converting hhinc from character to numeric.
#> ✔ Added: cvista_hhinc_c.
head(cvista)
#>            persid        hhid person numstops monthofbirth yearofbirth age    sex relationship         persinc     carlicence mbikelicence otherlicence    nolicence fulltimework
#> 1: Y12H0000101P01 Y12H0000101      1        2        April        1962  50   Male         Self $1000-1249 p.w.   Full Licence            N            N Some Licence            Y
#> 2: Y12H0000101P02 Y12H0000101      2        5      January        1969  43 Female       Spouse     $1-199 p.w.   Full Licence            N            N Some Licence            N
#> 3: Y12H0000101P03 Y12H0000101      3        2         July        2000  11 Female        Child     Zero Income No Car Licence            N            N   No Licence            N
#> 4: Y12H0000101P04 Y12H0000101      4        2       August        2005   6 Female        Child     Zero Income No Car Licence            N            N   No Licence            N
#> 5: Y12H0000102P01 Y12H0000102      1        0      January        1955  57 Female       Spouse     $1-199 p.w.   Full Licence            N            N Some Licence            N
#> 6: Y12H0000102P02 Y12H0000102      2        5         July        1955  56   Male       Spouse   $300-399 p.w.   Full Licence            N            N Some Licence            N
#>    parttimework casualwork anywork studying        activities        mainact          worktype           emptype                                anzsco1             anzsco2
#> 1:            N          N       Y No Study No other activity Full-time Work       Fixed Hours     Paid Employee Community and Personal Service Workers Hospitality Workers
#> 2:            N          N       N No Study     Keeping House  Keeping House Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 3:            N          N       N  Primary No other activity Primary School Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 4:            N          N       N  Primary No other activity Primary School Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 5:            N          N       N No Study           Retired        Retired Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#> 6:            N          N       N No Study        Unemployed     Unemployed Not in Work Force Not in Work Force                      Not in Work Force   Not in Work Force
#>                                anzsic1                 anzsic2     startplace additionaltravel cycledexercise cycledother cycledshopping cycledwork nocycled disabledtrans
#> 1: Administrative and Support Services Administrative Services Survey address                N              N           N              N          N        Y             N
#> 2:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 3:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 4:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#> 5:                   Not in Work Force       Not In Work Force Survey address              N/A              N           N              N          N        Y             N
#> 6:                   Not in Work Force       Not In Work Force Survey address                N              N           N              N          N        Y             N
#>    taxitrans wheelchairtrans accesstrans wdperswgt weperswgt survey_period travdow travmonth day_type      dwelltype        owndwell hhsize hhinc visitors aveage youngest oldest
#> 1:         N               N           N     84.77        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4  1225        0     27        6     50
#> 2:         N               N           N     92.98        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4  1225        0     27        6     50
#> 3:         N               N           N    100.23        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4  1225        0     27        6     50
#> 4:         N               N           N     99.02        NA       2012-13  Monday       May  Weekday Separate House     Fully Owned      4  1225        0     27        6     50
#> 5:         N               N           N     82.61        NA       2012-13 Tuesday       May  Weekday Separate House Being Purchased      4  1700        0     40       21     57
#> 6:         N               N           N     85.31        NA       2012-13 Tuesday       May  Weekday Separate House Being Purchased      4  1700        0     40       21     57
#>    yearslived monthslived adultbikes kidsbikes totalbikes cars fourwds utes vans trucks mbikes othervehs totalvehs wdhhwgt wehhwgt        homelga home_sub_region home_region
#> 1:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 2:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 3:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 4:          7           9          0         2          2    2       0    0    0      0      0         0         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 5:          9           4          0         0          0    3       0    0    0      0      0         0         3   97.00      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#> 6:          9           4          0         0          0    3       0    0    0      0      0         0         3   97.00      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
#>    homepc cvista_age cvista_age5_c cvista_sex                         cvista_anzsco1                      cvista_anzsic1    cvista_emptype cvista_studying cvista_relationship_c
#> 1:   3082         50   50-54 years       Male Community and Personal Service Workers Administrative and Support Services     Paid Employee        No Study                  Self
#> 2:   3082         43   40-44 years     Female                      Not in Work Force                   Not in Work Force Not in Work Force        No Study                Spouse
#> 3:   3082         11   10-14 years     Female                      Not in Work Force                   Not in Work Force Not in Work Force         Primary                 Child
#> 4:   3082          6     5-9 years     Female                      Not in Work Force                   Not in Work Force Not in Work Force         Primary                 Child
#> 5:   3082         57   55-59 years     Female                      Not in Work Force                   Not in Work Force Not in Work Force        No Study                Spouse
#> 6:   3082         56   55-59 years       Male                      Not in Work Force                   Not in Work Force Not in Work Force        No Study                Spouse
#>    cvista_dwelltype cvista_owndwell_c cvista_cars_c                  cvista_hhinc_c
#> 1:   Separate House       Fully Owned             2 $1,000-$1,249 ($52,000-$64,999)
#> 2:   Separate House       Fully Owned             2 $1,000-$1,249 ($52,000-$64,999)
#> 3:   Separate House       Fully Owned             2 $1,000-$1,249 ($52,000-$64,999)
#> 4:   Separate House       Fully Owned             2 $1,000-$1,249 ($52,000-$64,999)
#> 5:   Separate House   Being Purchased             3 $1,500-$1,749 ($78,000-$90,999)
#> 6:   Separate House   Being Purchased             3 $1,500-$1,749 ($78,000-$90,999)
```
