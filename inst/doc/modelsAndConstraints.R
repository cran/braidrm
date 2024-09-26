## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(braidrm)

## -----------------------------------------------------------------------------
surface <- synergisticExample

coef(braidrm(measure ~ concA + concB, surface, model="kappa1", getCIs=FALSE))
coef(braidrm(measure ~ concA + concB, surface, model="kappa2", getCIs=FALSE))
coef(braidrm(measure ~ concA + concB, surface, model="kappa3", getCIs=FALSE))

## -----------------------------------------------------------------------------
startingParameter <- c(2,2,2,2,0,0,1,1,1)

bfit <- braidrm(measure ~ concA + concB, surface,
				model=c(1,3,5,6,7,8), start=startingParameter,
				getCIs=FALSE)
coef(bfit)

bfit <- braidrm(measure ~ concA + concB, surface,
				model=c(1,2,5,6,9), start=startingParameter,
				getCIs=FALSE)
coef(bfit)

## -----------------------------------------------------------------------------
bfit <- braidrm(measure ~ concA + concB, surface,
				model=c(1:5,6,7,8), start=startingParameter,
				upper = c(0.75,0.75,NA,NA,NA,NA,0.7,NA,NA),
				getCIs=FALSE)
coef(bfit)

bfit <- braidrm(measure ~ concA + concB, surface,
				model=c(1:5,6,9), start=startingParameter,
				lower = c(NA,NA,3,3,NA,0,0),
				getCIs=FALSE)
coef(bfit)

