% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/help_functions.R
\name{create_A}
\alias{create_A}
\title{Linking unique water level measurements to actual
water level measurements}
\usage{
create_A(h)
}
\arguments{
\item{h}{numeric vector of stage measurements in meters}
}
\value{
\itemize{
\item A: Matrix \strong{A} linking unique water level measurements (\strong{h'}) to actual
water level measurements (h) such that \strong{h}=\strong{Ah'}
}
}
\description{
Adist links unique water level measurements (\strong{h'}) to actual
water level measurements (h) such that \strong{h}=\strong{Ah'}.
from the measurements.
}
\references{
Birgir Hrafnkelsson, Helgi Sigurdarson and Sigurdur M. Gardarson (2015) \emph{Bayesian Generalized Rating Curves}
}
