% File src/library/base/man/deparseOpts.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2007 R Core Development Team
% Modifications for pqR copyright (C) 2014 Radford M. Neal
% Distributed under GPL 2 or later

\name{deparseOpts}
\alias{.deparseOpts}
\title{Options for Expression Deparsing}
\description{
  Process the deparsing options for \code{deparse}, \code{dput} and
  \code{dump}.
}
\usage{
.deparseOpts(control)
}
\arguments{
  \item{control}{character vector of deparsing options.}
}
\details{
  This is called by \code{\link{deparse}}, \code{\link{dput}} and
  \code{\link{dump}} to process their \code{control} argument.

  The \code{control} argument is a vector containing zero or more of the
  following strings.  Partial string matching is used.
  \describe{
    \item{\code{keepInteger}}{
      Either surround integer vectors by \code{as.integer()} or use
      suffix \code{L}, so they are not converted to type double when
      parsed.  This includes making sure that integer \code{NA}s are
      preserved (via \code{NA_integer_} if there are no non-\code{NA}
      values in the vector, unless \code{"S_compatible"} is set).
    }
    \item{\code{quoteExpressions}}{
      Surround expressions with \code{quote()}, so they are not
      evaluated when re-parsed.
    }
    \item{\code{showAttributes}}{
      If the object has attributes (other than a \code{source}
      attribute), use \code{structure()} to display them as well as the
      object value.  This is the default for \code{\link{deparse}} and
      \code{\link{dput}}.
    }
    \item{\code{useSource}}{
      If the object has a \code{source} attribute, display that instead
      of deparsing the object.  Currently only applies to function
      definitions.
    }
    \item{\code{warnIncomplete}}{
      Some exotic objects such as \link{environment}s,
      external pointers, etc. can not be deparsed properly.  This option
      causes a warning to be issued if the deparser recognizes one of these
      situations.

      Also, the parser in \R < 2.7.0 would only accept strings of up to
      8192 bytes, and this option gives a warning for longer strings.
    }
    \item{\code{keepNA}}{
      Integer, real and character \code{NA}s are surrounded by coercion
      where necessary to ensure that they are parsed to the same type.
    }
    \item{\code{all}}{
      An abbreviated way to specify all of the options
      listed above.  This is the default for \code{dump}, and the options
      used by \code{\link{edit}} (which are fixed).
    }
    \item{\code{delayPromises}}{
      Deparse promises in the form <promise: expression> rather than
      evaluating them.  The value and the environment of the promise
      will not be shown and the deparsed code cannot be sourced.
    }
    \item{\code{S_compatible}}{
      Make deparsing as far as possible compatible with S and \R < 2.5.0.
      For compatibility with S, integer values of double vectors are
      deparsed with a trailing decimal point.  Backticks are not used.
    }
    \item{\code{codePromises}}{
      Deparse promises as the code that they contain, rather than
      evaluating them.  Like \code{delayPromises}, but without
      the "promise:" comment around the code expression.
    }
  }
  For the most readable (but perhaps incomplete) display, use
  \code{control = NULL}. This displays the object's value, but not its
  attributes.  The default in \code{\link{deparse}} is to display the
  attributes as well, but not to use any of the other options to make
  the result parseable.  (\code{\link{dput}} and \code{\link{dump}} do
  use more default options, and printing of functions without sources
  uses \code{c("keepInteger", "keepNA")}.)

  Using \code{control = "all"} comes closest to making \code{deparse()}
  an inverse of \code{parse()}.  However, not all objects are
  deparse-able even with this option.  A warning will be issued if the
  function recognizes that it is being asked to do the impossible.
}
\value{
  A numerical value corresponding to the options selected.
}
\keyword{programming}
