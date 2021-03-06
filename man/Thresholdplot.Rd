% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Finalfunctions.R
\name{Thresholdplot}
\alias{Thresholdplot}
\title{This function helps graph a ggviolin plot for data visualization.}
\usage{
Thresholdplot(dataname, xname, yname, title)
}
\arguments{
\item{dataname}{the data file name, passed to \code{\link{ggviolin}}}

\item{xname}{the treatment column name}

\item{yname}{the dependent variable}

\item{title}{the title of the plot}
}
\value{

}
\description{
This function helps graph a ggviolin plot for data visualization.
}
\examples{
Thresholdplot(ephys1, "Treatment", "Voltage.threshold.mV", "Voltage Threshold (mV)")
}
