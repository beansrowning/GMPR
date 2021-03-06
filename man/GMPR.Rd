% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GMPR.R
\name{GMPR}
\alias{GMPR}
\title{Geometric Mean of Pairwise Ratios (GMPR)}
\usage{
GMPR(OTUmatrix, min_ct = 2, intersect_no = 4)
}
\arguments{
\item{OTUmatrix}{A matrix or data.frame of sampling data of dim \code{m} * \code{n} (\code{m} samples and \code{n} features)}

\item{min_ct}{The minimum number of counts required to calculate ratios (default: 2)}

\item{intersect_no}{The minimum number of shared features between sample pair (default: 4)}
}
\value{
A vector of the size \code{n} with attribute "NSS". Samples with distinct sets of features will be output as \code{NA}.
}
\description{
Wrapper function of GMPR with appropriate datatype check and exception handling.
A simple but effective normalization method - for zeroinflated sequencing data such as microbiome-Seq data.
}
\details{
Normalization is the first and a critical step in microbiome sequencing data analysis to account for variable library sizes. 
Microbiome data contains a vast number of zeros due to the physical absence or under-sampling of the microbes. 
Here we propose GMPR - a simple but effective normalization method - for zero-inflated sequencing data such as microbiome data. 
Simulation studies and real datasets analyses demonstrate that the proposed method is more robust than competing methods, leading to more powerful detection of differentially abundant taxa and higher reproducibility of the relative abundances of taxa.

GMPR normalizes data following two steps:

First, to calculate \eqn{r_{ij}}, the median count ratio of nonzero counts between samples:
  \eqn{r_{ij} = median(ck_{i}/ck_{j})} (\eqn{k} in \code{1:OTU_number} and \eqn{c_{ki}}, \eqn{c_{kj}} is the non-zero count of the \code{k}th OTU)

Secondly, to calculate the size factor \eqn{s_{i}} for a given sample \code{i}:
  \eqn{s_{i} = geometric_mean(r_{ij})}
}
