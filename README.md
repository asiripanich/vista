
<!-- README.md is generated from README.Rmd. Please edit that file -->

# [vista](https://github.com/asiripanich/vista) 🚶‍♀️🚲🚗🚌

<!-- badges: start -->

[![R-CMD-check](https://github.com/asiripanich/vista/workflows/R-CMD-check/badge.svg)](https://github.com/asiripanich/vista/actions)
<!-- badges: end -->

✨ **Features** ✨

-   Offers `vista_dm`, a [public version of
    VISTA](https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications)
    as a relational data model in R, by leveraging on the
    [{dm}](https://cynkra.github.io/dm/) package.
-   🚧 (coming soon) Converts VISTA and 1% ABS Census Sample File to
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
vista18 <- get_vista18()
vista18_dm <- vista_to_dm(
  persons = vista18$persons,
  households = vista18$households,
  trips = vista18$trips,
  stops = vista18$stops,
  jte = vista18$jte,
  jtw = vista18$jtw
)
```

``` r
library(dm)
vista18_dm %>%
  dm_draw()
```

<img src="man/figures/README-vista-dm-draw.png" width="50%" />
