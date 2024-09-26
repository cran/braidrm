## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include=FALSE-----------------------------------------------------
library(braidrm)

## -----------------------------------------------------------------------------
ufit1 <- fitUrsaModel(measure ~ concA+concB, additiveExample)
coef(ufit1)

ufit2 <- fitUrsaModel(measure ~ concA+concB, synergisticExample)
coef(ufit2)

ufit3 <- fitUrsaModel(measure ~ concA+concB, antagonisticExample)
coef(ufit3)

## -----------------------------------------------------------------------------
mfit1 <- fitMusycModel(measure ~ concA+concB, additiveExample)
coef(mfit1)

mfit2 <- fitMusycModel(measure ~ concA+concB, synergisticExample)
coef(mfit2)

mfit3 <- fitMusycModel(measure ~ concA+concB, antagonisticExample)
coef(mfit3)

## -----------------------------------------------------------------------------
concs1 <- cbind(additiveExample$concA,additiveExample$concB)
act1 <- additiveExample$measure
mean(deviationSurface(concs1,act1,method="Bliss",range=c(0,1)))
mean(deviationSurface(concs1,act1,method="HSA",increasing=TRUE))
mean(deviationSurface(concs1,act1,method="Loewe"))
mean(deviationSurface(concs1,act1,method="ZIP",range=c(0,1)))

concs2 <- cbind(synergisticExample$concA,additiveExample$concB)
act2 <- synergisticExample$measure
mean(deviationSurface(concs2,act2,method="Bliss",range=c(0,1)))
mean(deviationSurface(concs2,act2,method="HSA",increasing=TRUE))
mean(deviationSurface(concs2,act2,method="Loewe"))
mean(deviationSurface(concs2,act2,method="ZIP",range=c(0,1)))

concs3 <- cbind(antagonisticExample$concA,additiveExample$concB)
act3 <- antagonisticExample$measure
mean(deviationSurface(concs3,act3,method="Bliss",range=c(0,1)))
mean(deviationSurface(concs3,act3,method="HSA",increasing=TRUE))
mean(deviationSurface(concs3,act3,method="Loewe"))
mean(deviationSurface(concs3,act3,method="ZIP",range=c(0,1)))

## -----------------------------------------------------------------------------
estimateCombinationIndices(concs1,act1,level=c(0.5))
estimateCombinationIndices(concs2,act2,level=c(0.5))
estimateCombinationIndices(concs3,act3,level=c(0.5))

