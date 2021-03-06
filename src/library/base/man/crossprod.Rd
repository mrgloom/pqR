% File src/library/base/man/crossprod.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2008 R Core Development Team
% Modifications for pqR Copyright (c) 2013 Radford M. Neal.
% Distributed under GPL 2 or later

\name{crossprod}
\alias{crossprod}
\alias{tcrossprod}
\title{Matrix Crossproduct}
\description{
  Given matrices \code{x} and \code{y} as arguments, return a matrix
  cross-product.  This is nearly equivalent to 
  the call \code{t(x) \%*\% y} (\code{crossprod}) or
  \code{x \%*\% t(y)} (\code{tcrossprod}), except for a slight difference
  regarding dimension names noted below.  

  Using \code{crossprod} and
  \code{tcrossprod} was somewhat faster than using \code{\%*\%} in
  R-2.15.0, but the difference is small in pqR, since pqR recognizes
  when an operand of \code{\%*\%} is written as a transpose, and 
  then does the same thing as \code{crossprod} or \code{tcrossprod}.
}
\usage{
crossprod(x, y = NULL)

tcrossprod(x, y = NULL)
}
\arguments{
  \item{x, y}{numeric or complex matrices: \code{y = NULL} is taken to
    be the same matrix as \code{x}.  Vectors are promoted to
    single-column or single-row matrices, depending on the context.}
}
\value{
  A double or complex matrix, with appropriate \code{dimnames} taken
  from \code{x} and \code{y}.
}
\details{
  The multiplication is done either by a BLAS routine or by a C routine,
  in the same way as for \code{\link{\%*\%}}, based on the setting of
  the \code{mat_mult_with_BLAS} option, except that a \code{NA}
  value for the fourth element of the \code{mat_mult_with_BLAS} option 
  (pertaining to matrix-matrix multiplies) is always equivalent to 
  \code{TRUE} for \code{crossprod} and \code{tcrossprod} (thereby 
  mimicking the behaviour of R Core releases to at least R-3.1.1).

  When the C routines are used for the multiplication, and helper
  threads are enabled, \code{crossprod} and \code{tcrossprod} will
  produce pipelined output, and \code{crossprod} but not
  \code{tcrossprod} will take pipelined input for the second operand.
  When a BLAS routine is used, the multiplication can be done in a
  helper thread (if allowed by the \code{BLAS_in_helpers} option),
  but with no pipelining of inputs or output.

  When \code{crossprod} or \code{tcrossprod} is given only one
  argument (the second defaulting to be the same as the first), or when the
  two arguments are recognizable as being identical because they are
  stored in the same memory location, the multiplication may be done
  more quickly by exploiting the fact that the result will be a
  symmetric matrix.

  When \code{x} or \code{y} are not matrices, they are treated as column or
  row matrices, but their \code{\link{names}} are usually \bold{not}
  promoted to \code{\link{dimnames}} (see example below).
}
%% Consider using a new optional argument, say 'make.names = NA'
%% {as in kronecker} with possible values  FALSE / NA / TRUE  where
%% FALSE gives empty dimnames; NA = current behavior; TRUE gives "as much as sensible"

\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.
}
\seealso{
  matrix multiplication operator \code{\link{\%*\%}}, 
  outer product operator \code{\link{\%o\%}},
  \code{\link{options}}.
}
\examples{
(z <- crossprod(1:4))    # = sum(1 + 2^2 + 3^2 + 4^2)
drop(z)                  # scalar
x <- 1:4; names(x) <- letters[1:4]; x
tcrossprod(as.matrix(x)) # is
identical(tcrossprod(as.matrix(x)),
          crossprod(t(x)))
tcrossprod(x)            # no dimnames

m <- matrix(1:6, 2,3) ; v <- 1:3; v2 <- 2:1
stopifnot(identical(tcrossprod(v, m), v \%*\% t(m)),
          identical(tcrossprod(v, m), crossprod(v, t(m))),
          identical(crossprod(m, v2), t(m) \%*\% v2))
}
\keyword{algebra}
\keyword{array}
