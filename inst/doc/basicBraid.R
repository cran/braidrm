## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(braidrm)

## -----------------------------------------------------------------------------
basicParameter <- c(1, 1, 3, 3, 0, 0, 100)

## -----------------------------------------------------------------------------
fullParameter <- c(1, 1, 3, 3, 0, 0, 100, 100, 100)

## -----------------------------------------------------------------------------
evalBraidModel(1, 0, basicParameter)
evalBraidModel(0, 1, basicParameter)
evalBraidModel(1, 1, basicParameter)

## -----------------------------------------------------------------------------
evalBraidModel(0.5, 0.5, basicParameter)

## -----------------------------------------------------------------------------
evalBraidModel(1, 0, fullParameter)
evalBraidModel(0, 1, fullParameter)
evalBraidModel(0.5, 0.5, fullParameter)

## -----------------------------------------------------------------------------
synergyParameter <- c(1, 1, 3, 3, 1.5, 0, 100)

evalBraidModel(1, 0, synergyParameter)
evalBraidModel(0, 1, synergyParameter)
evalBraidModel(0.5, 0.5, synergyParameter)

## ----include=FALSE------------------------------------------------------------
set.seed(20240804)

## -----------------------------------------------------------------------------
head(additiveExample)
additiveFit <- braidrm(measure ~ concA + concB, additiveExample)
summary(additiveFit)

## -----------------------------------------------------------------------------
synergisticFit <- braidrm(measure ~ concA + concB, synergisticExample)
summary(synergisticFit)

## -----------------------------------------------------------------------------
bestFit <- findBestBraid(measure ~ concA + concB, antagonisticExample,
						 defaults = c(0,1))
summary(bestFit)

