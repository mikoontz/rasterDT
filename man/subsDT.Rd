% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subsDT.R
\name{subsDT}
\alias{subsDT}
\title{Speedy Substitution of Values in a Raster}
\usage{
subsDT(x, dict, by = 1, which = 2, subsWithNA = TRUE,
  filename = "", ...)
}
\arguments{
\item{x}{Categorical \code{RasterLayer} with integer values giving
field class.}

\item{dict}{A \code{data.frame} or \code{data.table} with one (or
possibly more) columns corresponding to the values of cells in
\code{x} and one (or possibly more) columns giving the value
to which each value in \code{x} should be mapped.}

\item{by}{Vector of one or possibly more integers or character
strings giving the indices or names of the column in
\code{dict} containing the categorical values in \code{x}.}

\item{which}{Vector of one or possibly more integers or character
strings giving the indices or names of the column in
\code{dict} with the numerical values to which each value in
\code{by} should be mapped.}

\item{subsWithNA}{Logical. If \code{TRUE} values that are not
matched become NA.  If \code{FALSE}, they retain their
original value (which could also be \code{NA}). This latter
option is handy when you want to replace only one or a few
values. It cannot be used when \code{x} has multiple layers}

\item{filename}{Character string giving (optional) file name to
which the resultant raster should be written.}

\item{...}{Additional arguments as for
\code{\link[raster:writeRaster]{raster::writeRaster()}}, on
which this function relies.}
}
\value{
A \code{RasterLayer} object.
}
\description{
A fast \code{data.table}-based alternative to
\code{\link[raster:subs]{raster::subs()}}.
}
\examples{
r <- raster(ncol = 10, nrow = 10)
r[] <- round(runif(ncell(r)) * 10)
df <- data.frame(id = 2:8, v = c(10, 10, 11, 11, 12:14))
x <- subsDT(r, df)
x2 <- subsDT(r, df, subsWithNA = FALSE)

df$v2 <- df$v * 10
x3 <- subsDT(r, df, which = 2:3)

s <- stack(r, r*3)
names(s) <- c("first", "second")
x4 <- subsDT(s, df)
x5 <- subsDT(s, df, which = 2:3)
}
\author{
Joshua O'Brien
}
