% File src/library/utils/man/windows/DLL.version.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2010 R Core Team
% Distributed under GPL 2 or later

\name{DLL.version}
\alias{DLL.version}
\title{DLL Version Information}
\description{
  Return the version of the package and the version of \R used to
  build the DLL, if available.
}
\usage{
DLL.version(path)
}
\arguments{
  \item{path}{character vector of length one giving the complete path to
    the DLL.}
}
\value{
  If the DLL does not exist, \code{NULL}.
  
  A character vector of length two, giving the DLL version and the version of
  \R used to build the DLL.  If the information is not available, the
  corresponding string is empty.
}
\examples{
DLL.version(file.path(R.home("bin"), "R.dll"))
DLL.version(file.path(R.home(), "library/stats/libs", .Platform$r_arch, "stats.dll"))
}
\keyword{utilities}
