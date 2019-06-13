% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/freqDT.R
\docType{methods}
\name{freqDT}
\alias{freqDT}
\alias{freqDT,RasterStackBrick-method}
\title{Speedy Frequency Tabulation of Values in a RasterLayer}
\usage{
\S4method{freqDT}{RasterLayer}(x, digits = 0, value = NULL,
  useNA = c("ifany", "no", "always"), progress = "", ...)

\S4method{freqDT}{RasterStackBrick}(x, digits = 0, value = NULL,
  useNA = c("ifany", "no", "always"), merge = FALSE, progress = "",
  ...)
}
\arguments{
\item{x}{A \code{RasterLayer}, \code{RasterStack}, or
\code{RasterBrick} object field class.}

\item{...}{Additional arguments as for
\code{\link[raster:writeRaster]{raster::writeRaster()}}, on
which this function relies.}
}
\description{
A fast \code{data.table}-based drop-in replacement for
\code{\link[raster:freq]{raster::freq()}}.
}
\examples{
r <- raster(nrow = 18, ncol = 36)
r[] <- runif(ncell(r))
r[1:5] <- NA
r <- r * r * r * 5
freqDT(r)

freqDT(r, value=2)

s <- stack(r, r*2, r*3)
freqDT(s, merge = TRUE)
}
\author{
Joshua O'Brien
}