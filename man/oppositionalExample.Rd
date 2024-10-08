% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{oppositionalExample}
\alias{oppositionalExample}
\title{Example Oppositional Surface}
\format{
A data frame with 64 rows and 4 columns
\describe{
\item{concA}{The concentration of drug A}
\item{concB}{The concentration of drug B}
\item{truth}{The true response surface value at the given dose pair}
\item{measure}{The sampled noisy measurement of the response surface at
the given dose pair}
}
}
\usage{
oppositionalExample
}
\description{
A synthetically generated response surface using a flipped "oppositional"
parameter vector. The surface was generated with IDMA of 1, IDMB of 1, na
of 3, nb of 3, kappa of -0.5, E0 of 0, EfA of 1, EfB of -0.5, and Ef of 1;
the surface was flipped along the drug B axis (so \code{flip} was set to "B").
Every pair of concentrations is sampled once, with concentrations of 0 and a
seven-point two-fold dilution from 0.125 to 8. "Measurements" were sampled
from a normal noise distribution around ground truth values with a standard
deviation of 0.07.
}
\keyword{datasets}
