% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gplm0.R
\name{gplm0}
\alias{gplm0}
\title{Generalized Power Law Model with Constant Variance}
\usage{
gplm0(
  formula,
  data,
  c_param = NULL,
  h_max = NULL,
  parallel = T,
  forcepoint = rep(FALSE, nrow(data))
)
}
\arguments{
\item{formula}{an object of class "formula", with discharge column name as response and stage column name as a covariate, i.e. of the form y~x where y is discharge in \eqn{m^3/s} and x is stage in \eqn{m} (it is very important that the data is in the correct units).}

\item{data}{data.frame containing the variables specified in formula.}

\item{c_param}{stage for which there is zero discharge. If NULL, it is treated as unknown in the model and inferred from the data.}

\item{h_max}{maximum stage to which the rating curve should extrapolate to. If NULL, the maximum stage value in data is selected as an upper bound.}

\item{parallel}{logical value indicating whether to run the MCMC in parallel or not. Defaults to TRUE.}

\item{forcepoint}{logical vector of the same length as the number of rows in data. If an element at index i is TRUE it indicates that the rating curve should be forced through the i-th measurement. Use with care, as this will strongly influence the resulting rating curve.}
}
\value{
gplm0 returns an object of class "gplm0". An object of class "gplm0" is a list containing the following components: \cr
\item{\code{rating_curve}}{a data frame with 2.5\%, 50\% and 97.5\% quantiles of the posterior distribution of the rating curve.}
\item{\code{rating_curve_mean}}{a data frame with 2.5\%, 50\% and 97.5\% quantiles of the posterior distribution of the mean of the rating curve.}
\item{\code{param_summary}}{a data frame with 2.5\%, 50\% and 97.5\% quantiles of the posterior distribution of latent- and hyperparameters.}
\item{\code{beta_summary}}{a data frame with 2.5\%, 50\% and 97.5\% quantiles of the posterior distribution of \eqn{\beta}.}
\item{\code{Deviance_summary}}{a data frame with 2.5\%, 50\% and 97.5\% quantiles of the posterior distribution of the deviance.}
\item{\code{rating_curve_posterior}}{a matrix containing the full thinned posterior samples of the posterior distribution of the rating curve (excluding burn-in).}
\item{\code{rating_curve_mean_posterior}}{a matrix containing the full thinned posterior samples of the posterior distribution of the mean of the rating curve (excluding burn-in).}
\item{\code{a_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{a}.}
\item{\code{b_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{b}.}
\item{\code{c_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{c}.}
\item{\code{sigma_eps_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{\sigma_{\epsilon}}.}
\item{\code{sigma_beta_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{\sigma_{\beta}}.}
\item{\code{phi_beta_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{\phi_{\beta}}.}
\item{\code{sigma_eta_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{\sigma_{\eta}}.}
\item{\code{beta_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of \eqn{\beta}.}
\item{\code{Deviance_posterior}}{a numeric vector containing the full thinned posterior samples of the posterior distribution of the deviance excluding burnin samples.}
\item{\code{D_hat}}{deviance at the median value of the parameters}
\item{\code{num_effective_param}}{number of effective parameters, which is calculated as median(Deviance_posterior) - D_hat}
\item{\code{DIC}}{Deviance Information Criterion for the model, calculated as D_hat + 2*num_effective_parameters}
\item{\code{acceptance_rate}}{proportion of accepted samples in the thinned MCMC chain (excluding burn-in).}
\item{\code{formula}}{object of type "formula" provided by the user.}
\item{\code{data}}{data provided by the user.}
\item{\code{run_info}}{Information about the specific parameters used in the MCMC chain.}
}
\description{
gplm0 is used to fit a discharge rating curve for paired measurements of stage and discharge using a Generalized Power Law Model with constant variance as described in Hrafnkelsson et al. See "Details" for a more elaborate description of the model.
}
\details{
The generalized power-law model is of the form
\deqn{Q=a(h-c)^{f(h)}}
where \eqn{Q} is discharge, \eqn{h} is stage, \eqn{a} and \eqn{c} are unknown constants and \eqn{f} is a function of  \eqn{h} referred to as the generalized power-law exponent.\cr\cr
The Bayesian generalized power-law model is presented as a Bayesian hierarchical model. The function \eqn{f} is modelled at the latent level as a fixed constant b plus a continuous stochastic process which is assumed to be twice differentiable. The model is on a logarithmic scale
\deqn{log(Q_i) = log(a) + (b + \beta(h_i)) log(h_i - c) + \epsilon,     i = 1,...,n}
where \eqn{\epsilon} follows a normal distribution with mean zero and variance \eqn{\sigma_\epsilon^2}, independent of stage. The stochastic process \eqn{\beta(h)} is assumed a priori to be a Gaussian process governed by a Matern covariance function with smoothness parameter \eqn{\nu = 2.5}. An efficient posterior simulation is achieved by sampling from the joint posterior density of the hyperparameters of the model, and then sampling from the density of the latent parameters conditional on the hyperparameters.\cr\cr
Bayesian inference is based on the posterior density and summary statistics such as the posterior mean and 95\% posterior intervals are based on the posterior density. Analytical formulas for these summary statistics are intractable in most cases and thus they are computed by generating samples from the posterior density using a Markov chain Monte Carlo simulation.
}
\examples{
\dontrun{
data(V316_river)
set.seed(1)
formula <- Q~W
gplm0.fit <- gplm0(formula,V316_river)
summary(gplm0.fit)
plot(gplm0.fit)
gplm0.fit_known_c <- gplm0(formula,V316_river,c_param=0.75,h_max=2)
summary(gplm0.fit_known_c)
plot(gplm0.fit_known_c)
}
}
\references{
B. Hrafnkelsson, H. Sigurdarson, S.M. Gardarsson, 2020, Generalization of the power-law rating curve using hydrodynamic theory and Bayesian hierarchical modeling. arXiv
preprint 2010.04769
}
\seealso{
\code{\link{summary.gplm0}} for summaries, \code{\link{predict.gplm0}} for prediction. It is also useful to look at \code{\link{spread_draws}} and \code{\link{plot.gplm0}} to help visualize the full posterior distributions.
}
