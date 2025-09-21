
# PackageLab3

<!-- badges: start -->
[![R-CMD-check](https://github.com/sojaabraham/Lab_3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sojaabraham/Lab_3/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of PackageLab3 is to provide implementations of two algorithms in R:  
1. euclidean() – get the greatest common divisor of two numbers.  
2. dijkstra() – compute shortest paths in a weighted graph using Dijkstra's algorithm.

## Installation

You can install the development version of PackageLab3 from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("sojaabraham/Lab_3")
```

## Example
This is a basic example which shows you how to solve a common problem:

``` r
library(PackageLab3)

#Euclidean
euclidean(120, 25)

wiki_graph <-
data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))

dijkstra(wiki_graph, 1)

```

