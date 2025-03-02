% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plm_methods.R
\name{predict.gplm0}
\alias{predict.gplm0}
\title{Predict method for gplm0 fit}
\usage{
\method{predict}{gplm0}(object, newdata = NULL, ...)
}
\arguments{
\item{object}{an object of class "gplm0"}

\item{newdata}{a numeric vector of stage values for which to predict. If omitted, the stage values in the data are used.}

\item{...}{not used in this function}
}
\value{
numeric vector of discharge values for the stage values given in newdata
}
\description{
Print the results of a  object
}
\examples{
\dontrun{
data(V316_river)
f <- Q~W
gplm0.fit <- gplm0(f,V316_river,h_max=2)
#predict rating curve on a equally 1 cm spaced grid from 1 to 2 meters
predict(gplm0.fit,newdata=seq(1,2,by=0.01))
}
}
\seealso{
\code{\link{gplm0}} for fitting the gplm0 model,\code{\link{summary.gplm0}} for summaries, \code{\link{predict.gplm0}} for prediction. It is also useful to look at \code{\link{spread_draws}} and \code{\link{plot.gplm0}} to help visualize the full posterior distributions.
}
