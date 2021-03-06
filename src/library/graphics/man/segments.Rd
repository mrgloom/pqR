% File src/library/graphics/man/segments.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2009 R Core Development Team
% Distributed under GPL 2 or later

\name{segments}
\alias{segments}
\title{Add Line Segments to a Plot}
\description{
  Draw line segments between pairs of points.
}
\usage{
segments(x0, y0, x1 = x0, y1 = y0,
         col = par("fg"), lty = par("lty"), lwd = par("lwd"),
         \dots)
}
\arguments{
  \item{x0, y0}{coordinates of points \bold{from} which to draw.}
  \item{x1, y1}{coordinates of points \bold{to} which to draw.  At least
    one must be supplied.}
  \item{col, lty, lwd}{\link{graphical parameters} as in
    \code{\link{par}}, possibly vectors.  \code{NA} values in \code{col}
    cause the segment to be omitted.}
  \item{\dots}{further \link{graphical parameters} (from \code{\link{par}}),
    such as \code{xpd} and the line characteristics \code{lend}, \code{ljoin}
    and \code{lmitre}.}
}
\details{
  For each \code{i}, a line segment is drawn between the point
  \code{(x0[i], y0[i])} and the point \code{(x1[i], y1[i])}.  The
  coordinate vectors will be recycled to the length of the longest.

  The \link{graphical parameters} \code{col}, \code{lty} and \code{lwd} can be
  vectors of length greater than one and will be recycled if necessary.
}
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.
}
\seealso{
  \code{\link{arrows}}, 
  \code{\link{polygon}} for slightly easier and less flexible line
  drawing, and
  \code{\link{lines}} for the usual polygons.
}
\examples{
x <- stats::runif(12); y <- stats::rnorm(12)
i <- order(x,y); x <- x[i]; y <- y[i]
plot(x, y, main="arrows(.) and segments(.)")
## draw arrows from point to point :
s <- seq(length(x)-1)# one shorter than data
arrows(x[s], y[s], x[s+1], y[s+1], col= 1:3)
s <- s[-length(s)]
segments(x[s], y[s], x[s+2], y[s+2], col= 'pink')
}
\keyword{aplot}
