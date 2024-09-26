## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(braidrm)
set.seed(20240820)

## -----------------------------------------------------------------------------
surface <- incompleteExample
head(surface)
head(surface[surface$concA==0,])

## -----------------------------------------------------------------------------
trueParameter <- c(1, 100, 3, 3, 0, 0, 1, 0.1, 1)
trueSurface <- evalBraidModel(surface$concA,surface$concB,trueParameter)
trueError <- surface$measure - trueSurface

sqrt(mean(trueError^2))

## -----------------------------------------------------------------------------
bfit <- braidrm(measure~concA+concB,surface, prior="none")
coef(bfit)

## -----------------------------------------------------------------------------
sqrt(mean(resid(bfit)^2))

## -----------------------------------------------------------------------------
summary(bfit)

## -----------------------------------------------------------------------------
stableFit <- braidrm(measure~concA+concB,surface,
					 prior=kappaPrior(0.05,"moderate"))

sqrt(mean(resid(stableFit)^2))
summary(stableFit)

