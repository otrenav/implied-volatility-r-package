
| [Website](http://links.otrenav.com/website) | [Twitter](http://links.otrenav.com/twitter) | [LinkedIn](http://links.otrenav.com/linkedin)  | [GitHub](http://links.otrenav.com/github) | [GitLab](http://links.otrenav.com/gitlab) | [CodeMentor](http://links.otrenav.com/codementor) |

---

# European Options Implied Volatilities (R Package)

This repository contains code for an R package that contains functions to
compute and graph implied volatility for European Options. This was developed
by Omar Trejo for John Dale.

- Omar Trejo
- September, 2016

## How to use this package

### 1. Make sure you have devtools installed

```
install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
```

Technically `roxygen2`, `testthat`, and `knitr` are only required if you are
going to further develop this (or any other) package.

### 2. Install the package using GitHub

```
devtools::install_github("otrenav/implied_volatility")
```

> NOTE: if you use yourown repository or fork this one, remember to install from
> your repository by changing `otrenav` to user corresponding user name.

### 3. Load the package in R

```
library(ImpliedVolatility)
```

### 4. Use the functions included in the pacakge

To see the available datasets included in the package (currently only one),
execute:

```
data(package = "ImpliedVolatility")
```

If you want to use the included European Options dataset, execute:

```
data(european_options)
```

You may compute and graph the implied volatilities with:

```
results <- compute_and_graph_implied_volatilities(european_options)
```

You may also use the functions directly yourself:

```
implied_voltility <- compute_implied_volatilities("call", )
results <- append_implied_volatilities(european_options)
graph_implied_volatility(results)
```

## Notes on RStudio

- You can use `devtools::document()` to build the documentation
- You can use `CTRL/CMD + SHIFT + B` in RStudio to build the package

If you want to re-build documentation everytime you build the package adjust
your settings inside RStudio as follows:

1. Click on menu: "Build" / "Configure Build Tools"
2. Activate "Generate documentation with Roxygen"
3. Click on "Configure"
4. Activate "Build & Reload"
5. Save your settings

The previous instructions work fine using:

- RStudio version 0.99.903
- R version 3.2.3

---

> "The best ideas are common property."
>
> —Seneca
