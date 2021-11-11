
<!-- README.md is generated from README.Rmd. Please edit that file -->

# [vista](https://github.com/asiripanich/vista) 🚶‍♀️🚲🚗🚌

<!-- badges: start -->

[![R-CMD-check](https://github.com/asiripanich/vista/workflows/R-CMD-check/badge.svg)](https://github.com/asiripanich/vista/actions)
<!-- badges: end -->

✨ **Features** ✨

  - \[x\] Offers `vista_dm`, a [public version of
    VISTA](https://transport.vic.gov.au/about/data-and-research/vista/vista-data-and-publications)
    as a relational data model in R, by leveraging on the
    [{dm}](https://cynkra.github.io/dm/) package.
  - \[ \] Converts VISTA’s fields to match ABS Census microdata, and
    vice versa.

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
library(dm)
vista_dm
#> ── Metadata ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
#> Tables: `persons`, `households`, `trips`, `stops`, `jte`, `jtw`
#> Columns: 301
#> Primary keys: 6
#> Foreign keys: 5
```

``` r
vista_dm %>%
  dm_draw()
```

<img src="man/figures/README-vista-dm-draw.png" width="50%" />
