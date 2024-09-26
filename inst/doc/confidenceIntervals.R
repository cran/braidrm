## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(braidrm)

## ----include=FALSE------------------------------------------------------------
set.seed(20240823)

## -----------------------------------------------------------------------------
summary(braidrm(measure ~ concA + concB, additiveExample, getCIs=TRUE))

summary(braidrm(measure ~ concA + concB, synergisticExample, getCIs=TRUE))

## -----------------------------------------------------------------------------
bfit <- braidrm(measure ~ concA + concB, antagonisticExample, getCIs = FALSE)
summary(bfit)

bfit_ci <- calcBraidBootstrap(bfit)
summary(bfit_ci)


## -----------------------------------------------------------------------------
# CI on the predicted effect at dose pair (10, 10)
calcBraidConfInt(bfit_ci, function(p) evalBraidModel(10,10,p))

# CI on the IAE at 50% and 90% efficacy
calcBraidConfInt(bfit_ci,function(p) estimateIAE(p,c(0.5,0.9),c(10,10)))

## ----error=TRUE---------------------------------------------------------------
# `bfit` does not have confidence intervals
calcBraidConfInt(bfit, function(p) evalBraidModel(10,10,p))

