% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clustRcompaR.R
\name{compare}
\alias{compare}
\title{Compare wrapper function}
\usage{
compare(clustering_solution, compare_which, which_clusters = NULL,
  which_groups = NULL)
}
\arguments{
\item{clustering_solution}{The output from the \code{cluster} function.}

\item{compare_which}{A factor variable of the groups of interest for comparison.}

\item{which_clusters}{Clusters to be included in the comparison. Default is all clusters.}

\item{which_groups}{Levels of the grouping factor to be included in the comparison. Default is all levels.}
}
\description{
Compare wrapper function
}
\details{
Function for comparing clustering solution between subgroups.  Output is contingency table for the specified groups and clusters.
}
\examples{
library(clustRcompaR)
library(dplyr)
library(quanteda)

d <- inaugural_addresses
d <- mutate(d, century = ifelse(Year < 1800, "17th",
                                ifelse(Year >= 1800 & Year < 1900, "18th",
                                       ifelse(Year >= 1900 & Year < 2000, "19th", "20th"))))

three_clusters <- cluster(d, century, n_clusters = 3)
extract_terms(three_clusters)

three_clusters_comparison <- compare(three_clusters, "century")
compare_plot(three_clusters_comparison)
}

