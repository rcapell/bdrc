% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plm_methods.R
\name{summary.gplm}
\alias{summary.gplm}
\title{Summarizing plm fit}
\usage{
\method{summary}{gplm}(object, ...)
}
\arguments{
\item{object}{an object of class "gplm"}

\item{...}{not used in this function}
}
\value{
gplm0 returns an object of class "plm"\cr\cr
}
\description{
Summarize the results of a gplm object
}
\examples{
\dontrun{
data(V316_river)
f <- Q~W
gplm.fit <- gplm(f,V316_river)
summary(gplm.fit)
}
}
\seealso{
\code{\link{gplm}} for fitting the gplm model,\code{\link{summary.gplm}} for summaries, \code{\link{predict.gplm}} for prediction. It is also useful to look at \code{\link{spread_draws}} and \code{\link{plot.gplm}} to help visualize the full posterior distributions.
}
