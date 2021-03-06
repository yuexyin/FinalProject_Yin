% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Finalfunctions.R
\name{shinygraph}
\alias{shinygraph}
\title{This function helps use shiny to drag and select data on a graph}
\usage{
shinygraph(dframe, xvar, yvar, viewer = paneViewer())
}
\arguments{
\item{dframe}{data file name}

\item{xvar}{x variable name}

\item{yvar}{y variable name}

\item{viewer}{}
}
\value{

}
\description{
This function helps use shiny to drag and select data on a graph
}
\examples{
shinygraph(ephys1, "Treatment", "Voltage.threshold.mV")
}
