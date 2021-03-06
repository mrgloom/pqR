% File src/library/base/man/Reserved.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2008 R Core Development Team
% Distributed under GPL 2 or later

\name{Reserved}
\alias{Reserved}
\alias{reserved}
\title{Reserved Words in R}
\description{
  The reserved words in \R's parser are

  \code{\link{if}} \code{\link{else}} \code{\link{repeat}} \code{\link{while}}
  \code{\link{function}} \code{\link{for}} \code{in}
  \code{\link{next}} \code{\link{break}}

  \code{\link{TRUE}} \code{\link{FALSE}} \code{\link{NULL}}
  \code{\link{Inf}} \code{\link{NaN}}
  \code{\link{NA}} \code{\link{NA_integer_}} \code{\link{NA_real_}}
  \code{\link{NA_complex_}} \code{\link{NA_character_}}

  \code{\dots} and \code{..1}, \code{..2} etc, which are used to refer to
  arguments passed down from an enclosing function.
}
\details{
  Reserved words outside \link[=Quotes]{quotes} are always parsed to be
  references to the objects linked to in the \sQuote{Description}, and
  hence they are not allowed as syntactic names (see
  \code{\link{make.names}}).  They \bold{are} allowed as non-syntactic
  names, e.g. inside \link{backtick} quotes.
}
\keyword{programming}
\keyword{documentation}
