# recode to cvista

    Code
      vista_persons_and_households <- vista_dm %>% dm_select_tbl(persons, households) %>%
        dm_squash_to_tbl(persons) %>% collect() %>% data.table::setDT()
      out <- vista_to_cvista(vista_persons_and_households)
    Message <cliMessage>
      i Creating a copy of x
      v Added the following ID fields hhid and persid to extra_cols.
      v Added: cvista_age.
      v Added: cvista_age5_c.
      v Added: cvista_sex.
      v Added: cvista_anzsco1.
      v Added: cvista_anzsic1.
      v Added: cvista_emptype.
      v Added: cvista_studying.
      v Added: cvista_relationship_c.
      v Added: cvista_dwelltype.
      v Added: cvista_owndwell_c.
      v Added: cvista_cars_c.
      i Converting hhinc from character to numeric.
      v Added: cvista_hhinc_c.
    Code
      out
    Output
                     persid        hhid person numstops monthofbirth yearofbirth age
          1: Y12H0000101P01 Y12H0000101      1        2        April        1962  50
          2: Y12H0000101P02 Y12H0000101      2        5      January        1969  43
          3: Y12H0000101P03 Y12H0000101      3        2         July        2000  11
          4: Y12H0000101P04 Y12H0000101      4        2       August        2005   6
          5: Y12H0000102P01 Y12H0000102      1        0      January        1955  57
         ---                                                                        
      65890: Y18H3130539P04 Y18H3130539      4        5      January        2001  17
      65891: Y18H3130540P01 Y18H3130540      1        2       August        1962  55
      65892: Y18H3130540P02 Y18H3130540      2        2     February        1961  57
      65893: Y18H3130541P01 Y18H3130541      1        2         July        1943  75
      65894: Y18H3130541P02 Y18H3130541      2        6        April        1944  74
                sex relationship         persinc      carlicence mbikelicence
          1:   Male         Self $1000-1249 p.w.    Full Licence            N
          2: Female       Spouse     $1-199 p.w.    Full Licence            N
          3: Female        Child     Zero Income  No Car Licence            N
          4: Female        Child     Zero Income  No Car Licence            N
          5: Female       Spouse     $1-199 p.w.    Full Licence            N
         ---                                                                 
      65890: Female        Child     $1-199 p.w. Learners Permit            N
      65891:   Male         Self $1500-1999 p.w.    Full Licence            Y
      65892: Female       Spouse   $300-399 p.w.    Full Licence            N
      65893:   Male         Self   $300-399 p.w.    Full Licence            N
      65894: Female       Spouse   $400-599 p.w.    Full Licence            N
             otherlicence    nolicence fulltimework parttimework casualwork anywork
          1:            N Some Licence            Y            N          N       Y
          2:            N Some Licence            N            N          N       N
          3:            N   No Licence            N            N          N       N
          4:            N   No Licence            N            N          N       N
          5:            N Some Licence            N            N          N       N
         ---                                                                       
      65890:            N Some Licence            N            N          N       N
      65891:            N Some Licence            Y            N          N       Y
      65892:            N Some Licence            N            Y          N       Y
      65893:            N Some Licence            N            N          N       N
      65894:            N Some Licence            N            N          N       N
              studying        activities          mainact          worktype
          1:  No Study No other activity   Full-time Work       Fixed Hours
          2:  No Study     Keeping House    Keeping House Not in Work Force
          3:   Primary No other activity   Primary School Not in Work Force
          4:   Primary No other activity   Primary School Not in Work Force
          5:  No Study           Retired          Retired Not in Work Force
         ---                                                               
      65890: Secondary No other activity Secondary School Not in Work Force
      65891:  No Study No other activity   Full-time Work       Fixed Hours
      65892:  No Study No other activity   Part-time Work       Fixed Hours
      65893:  No Study           Retired          Retired Not in Work Force
      65894:  No Study           Retired          Retired Not in Work Force
                       emptype                                anzsco1
          1:     Paid Employee Community and Personal Service Workers
          2: Not in Work Force                      Not in Work Force
          3: Not in Work Force                      Not in Work Force
          4: Not in Work Force                      Not in Work Force
          5: Not in Work Force                      Not in Work Force
         ---                                                         
      65890: Not in Work Force                      Not in Work Force
      65891:     Paid Employee                               Managers
      65892:     Paid Employee        Machinery Operators and Drivers
      65893: Not in Work Force                      Not in Work Force
      65894: Not in Work Force                      Not in Work Force
                         anzsco2                             anzsic1
          1: Hospitality Workers Administrative and Support Services
          2:   Not in Work Force                   Not in Work Force
          3:   Not in Work Force                   Not in Work Force
          4:   Not in Work Force                   Not in Work Force
          5:   Not in Work Force                   Not in Work Force
         ---                                                        
      65890:   Not in Work Force                   Not in Work Force
      65891:      MANAGERS (NEC)                      Other Services
      65892:        Storepersons                        Retail Trade
      65893:   Not in Work Force                   Not in Work Force
      65894:   Not in Work Force                   Not in Work Force
                             anzsic2     startplace additionaltravel cycledexercise
          1: Administrative Services Survey address                N              N
          2:       Not In Work Force Survey address                N              N
          3:       Not In Work Force Survey address                N              N
          4:       Not In Work Force Survey address                N              N
          5:       Not In Work Force Survey address              N/A              N
         ---                                                                       
      65890:       Not In Work Force Survey address                N              N
      65891:    Other Services (NEC) Survey address                N              N
      65892:      Retail Trade (NEC) Survey address                N              N
      65893:       Not In Work Force Survey address                N              N
      65894:       Not In Work Force Survey address                N              N
             cycledother cycledshopping cycledwork nocycled disabledtrans taxitrans
          1:           N              N          N        Y             N         N
          2:           N              N          N        Y             N         N
          3:           N              N          N        Y             N         N
          4:           N              N          N        Y             N         N
          5:           N              N          N        Y             N         N
         ---                                                                       
      65890:           N              N          N        Y             N         N
      65891:           N              N          N        Y             N         N
      65892:           N              N          N        Y             N         N
      65893:           N              N          N        Y             N         N
      65894:           N              N          N        Y             N         N
             wheelchairtrans accesstrans wdperswgt weperswgt survey_period  travdow
          1:               N           N     84.77        NA       2012-13   Monday
          2:               N           N     92.98        NA       2012-13   Monday
          3:               N           N    100.23        NA       2012-13   Monday
          4:               N           N     99.02        NA       2012-13   Monday
          5:               N           N     82.61        NA       2012-13  Tuesday
         ---                                                                       
      65890:               N           N     58.00        NA       2017-18 Thursday
      65891:               N           N     49.04        NA       2017-18   Friday
      65892:               N           N     47.49        NA       2017-18   Friday
      65893:               N           N        NA    141.46       2017-18 Saturday
      65894:               N           N        NA    134.56       2017-18 Saturday
             travmonth    day_type      dwelltype        owndwell hhsize hhinc
          1:       May     Weekday Separate House     Fully Owned      4  1225
          2:       May     Weekday Separate House     Fully Owned      4  1225
          3:       May     Weekday Separate House     Fully Owned      4  1225
          4:       May     Weekday Separate House     Fully Owned      4  1225
          5:       May     Weekday Separate House Being Purchased      4  1700
         ---                                                                  
      65890:      July     Weekday Separate House Being Purchased      4  2750
      65891:      July     Weekday Separate House Being Purchased      2  2100
      65892:      July     Weekday Separate House Being Purchased      2  2100
      65893:      July Weekend Day Separate House     Fully Owned      2   850
      65894:      July Weekend Day Separate House     Fully Owned      2   850
             visitors aveage youngest oldest yearslived monthslived adultbikes
          1:        0     27        6     50          7           9          0
          2:        0     27        6     50          7           9          0
          3:        0     27        6     50          7           9          0
          4:        0     27        6     50          7           9          0
          5:        0     40       21     57          9           4          0
         ---                                                                  
      65890:        0     36       17     55         20           6          2
      65891:        0     56       55     57          1           0          1
      65892:        0     56       55     57          1           0          1
      65893:        0     74       74     75         30          11          0
      65894:        0     74       74     75         30          11          0
             kidsbikes totalbikes cars fourwds utes vans trucks mbikes othervehs
          1:         2          2    2       0    0    0      0      0         0
          2:         2          2    2       0    0    0      0      0         0
          3:         2          2    2       0    0    0      0      0         0
          4:         2          2    2       0    0    0      0      0         0
          5:         0          0    3       0    0    0      0      0         0
         ---                                                                    
      65890:         0          2    1       0    1    0      0      0         0
      65891:         0          1    1       0    1    0      0      1         0
      65892:         0          1    1       0    1    0      0      1         0
      65893:         0          0    2       0    0    0      0      0         0
      65894:         0          0    2       0    0    0      0      0         0
             totalvehs wdhhwgt wehhwgt        homelga home_sub_region home_region
          1:         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
          2:         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
          3:         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
          4:         2   96.38      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
          5:         3   97.00      NA Whittlesea (C)    MELB - outer  MSD_31LGAs
         ---                                                                     
      65890:         2   53.32      NA   Brimbank (C)    MELB - outer  MSD_31LGAs
      65891:         3   53.30      NA   Brimbank (C)    MELB - outer  MSD_31LGAs
      65892:         3   53.30      NA   Brimbank (C)    MELB - outer  MSD_31LGAs
      65893:         2      NA  147.86   Brimbank (C)    MELB - outer  MSD_31LGAs
      65894:         2      NA  147.86   Brimbank (C)    MELB - outer  MSD_31LGAs
             homepc cvista_age cvista_age5_c cvista_sex
          1:   3082         50   50-54 years       Male
          2:   3082         43   40-44 years     Female
          3:   3082         11   10-14 years     Female
          4:   3082          6     5-9 years     Female
          5:   3082         57   55-59 years     Female
         ---                                           
      65890:   3036         17   15-19 years     Female
      65891:   3036         55   55-59 years       Male
      65892:   3036         57   55-59 years     Female
      65893:   3036         75   75-79 years       Male
      65894:   3036         74   70-74 years     Female
                                     cvista_anzsco1
          1: Community and Personal Service Workers
          2:                      Not in Work Force
          3:                      Not in Work Force
          4:                      Not in Work Force
          5:                      Not in Work Force
         ---                                       
      65890:                      Not in Work Force
      65891:                               Managers
      65892:        Machinery Operators and Drivers
      65893:                      Not in Work Force
      65894:                      Not in Work Force
                                  cvista_anzsic1    cvista_emptype cvista_studying
          1: Administrative and Support Services     Paid Employee        No Study
          2:                   Not in Work Force Not in Work Force        No Study
          3:                   Not in Work Force Not in Work Force         Primary
          4:                   Not in Work Force Not in Work Force         Primary
          5:                   Not in Work Force Not in Work Force        No Study
         ---                                                                      
      65890:                   Not in Work Force Not in Work Force       Secondary
      65891:                      Other Services     Paid Employee        No Study
      65892:                        Retail Trade     Paid Employee        No Study
      65893:                   Not in Work Force Not in Work Force        No Study
      65894:                   Not in Work Force Not in Work Force        No Study
             cvista_relationship_c cvista_dwelltype cvista_owndwell_c cvista_cars_c
          1:                  Self   Separate House       Fully Owned             2
          2:                Spouse   Separate House       Fully Owned             2
          3:                 Child   Separate House       Fully Owned             2
          4:                 Child   Separate House       Fully Owned             2
          5:                Spouse   Separate House   Being Purchased             3
         ---                                                                       
      65890:                 Child   Separate House   Being Purchased             1
      65891:                  Self   Separate House   Being Purchased             1
      65892:                Spouse   Separate House   Being Purchased             1
      65893:                  Self   Separate House       Fully Owned             2
      65894:                Spouse   Separate House       Fully Owned             2
                                cvista_hhinc_c
          1:   $1,000-$1,249 ($52,000-$64,999)
          2:   $1,000-$1,249 ($52,000-$64,999)
          3:   $1,000-$1,249 ($52,000-$64,999)
          4:   $1,000-$1,249 ($52,000-$64,999)
          5:   $1,500-$1,749 ($78,000-$90,999)
         ---                                  
      65890: $2,500-$2,999 ($130,000-$155,999)
      65891: $2,000-$2,499 ($104,000-$129,999)
      65892: $2,000-$2,499 ($104,000-$129,999)
      65893:       $800-$999 ($41,600-$51,999)
      65894:       $800-$999 ($41,600-$51,999)
    Code
      cvista_cols <- grep("^cvista_", names(out), value = TRUE)
      cvista_cols
    Output
       [1] "cvista_age"            "cvista_age5_c"         "cvista_sex"           
       [4] "cvista_anzsco1"        "cvista_anzsic1"        "cvista_emptype"       
       [7] "cvista_studying"       "cvista_relationship_c" "cvista_dwelltype"     
      [10] "cvista_owndwell_c"     "cvista_cars_c"         "cvista_hhinc_c"       
    Code
      values <- lapply(cvista_cols, function(col) {
        unique(out[[col]])
      })
      values
    Output
      [[1]]
        [1]  50  43  11   6  57  56  28  21  47  46  16  13  52  22  41  15   9  45
       [19]  14  54  53  60  78  58  59  80  55  51  18  67  49  35  30   2   0  64
       [37]  61  89  88  68  65  33  37  12   8   5  40  42   3  31   1  29  36   4
       [55]  39  73  63  81  20  62  23  32  34  48  72  24  38  75  44  17  70  69
       [73]  19  10   7  83  25  26  27  82  66  71  76  87  74  86  79  77  92  85
       [91]  84  90  91  94  93  98  96  95 100  97 101 111 116
      
      [[2]]
       [1] "50-54 years"       "40-44 years"       "10-14 years"      
       [4] "5-9 years"         "55-59 years"       "25-29 years"      
       [7] "20-24 years"       "45-49 years"       "15-19 years"      
      [10] "60-64 years"       "75-79 years"       "80-84 years"      
      [13] "65-69 years"       "35-39 years"       "30-34 years"      
      [16] "0-4 years"         "85 years and over" "70-74 years"      
      
      [[3]]
      [1] "Male"   "Female"
      
      [[4]]
       [1] "Community and Personal Service Workers"
       [2] "Not in Work Force"                     
       [3] "Technicians and Trades Workers"        
       [4] "Clerical and Administrative Workers"   
       [5] "Professionals"                         
       [6] "Managers"                              
       [7] "Sales Workers"                         
       [8] "Machinery Operators and Drivers"       
       [9] "Labourers"                             
      [10] NA                                      
      
      [[5]]
       [1] "Administrative and Support Services"            
       [2] "Not in Work Force"                              
       [3] "Agriculture, Forestry and Fishing"              
       [4] "Construction"                                   
       [5] "Health Care and Social Assistance"              
       [6] "Financial and Insurance Services"               
       [7] "Manufacturing"                                  
       [8] "Education and Training"                         
       [9] "Accommodation and Food Services"                
      [10] "Public Administration and Safety"               
      [11] "Retail Trade"                                   
      [12] "Transport, Postal and Warehousing"              
      [13] "Arts and Recreation Services"                   
      [14] "Wholesale Trade"                                
      [15] "Electricity, Gas, Water and Waste Services"     
      [16] "Information Media and Telecommunications"       
      [17] "Other Services"                                 
      [18] "Professional, Scientific and Technical Services"
      [19] "Mining"                                         
      [20] "Rental, Hiring and Real Estate Services"        
      [21] NA                                               
      
      [[6]]
      [1] "Paid Employee"           "Not in Work Force"      
      [3] "Self-Employed"           "Work in Family Business"
      [5] "Employer"               
      
      [[7]]
      [1] "No Study"           "Primary"            "Full-time TAFE/Uni"
      [4] "Secondary"          "Part-time TAFE/Uni" "Something Else"    
      
      [[8]]
      [1] "Self"           "Spouse"         "Child"          "Other relative"
      [5] "Unrelated"     
      
      [[9]]
      [1] "Separate House"    "Terrace/Townhouse" "Other"            
      [4] "Flat or Apartment" NA                 
      
      [[10]]
      [1] "Fully Owned"                               
      [2] "Being Purchased"                           
      [3] "Rented (includes being occupied rent free)"
      [4] "Something Else"                            
      [5] NA                                          
      
      [[11]]
      [1] "2"  "3"  "1"  "0"  "4+" NA  
      
      [[12]]
       [1] "$1,000-$1,249 ($52,000-$64,999)"   "$1,500-$1,749 ($78,000-$90,999)"  
       [3] "$3,500-$3,999 ($182,000-$207,999)" "$1,750-$1,999 ($91,000-$103,999)" 
       [5] "$2,500-$2,999 ($130,000-$155,999)" "$2,000-$2,499 ($104,000-$129,999)"
       [7] "$150-$299 ($7,800-$15,599)"        "$1,250-$1,499 ($65,000-$77,999)"  
       [9] "$650-$799 ($33,800-$41,599)"       "$400-$499 ($20,800-$25,999)"      
      [11] "$500-$649 ($26,000-$33,799)"       "$1-$149 ($1-$7,799)"              
      [13] "$3,000-$3,499 ($156,000-$181,999)" "$4,000-$4,499 ($208,000-$233,999)"
      [15] "$4,500-$4,999 ($234,000-$259,999)" "$300-$399 ($15,600-$20,799)"      
      [17] "$800-$999 ($41,600-$51,999)"       "$5,000-$5,999 ($260,000-$311,999)"
      [19] "Nil income"                        "$6,000-$7,999 ($312,000-$415,999)"
      [21] NA                                  "$8,000 or more ($416,000 or more)"
      

