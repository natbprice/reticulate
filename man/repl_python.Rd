% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repl.R
\name{repl_python}
\alias{repl_python}
\title{Run a Python REPL}
\usage{
repl_python(
  module = NULL,
  quiet = getOption("reticulate.repl.quiet", default = FALSE),
  input = NULL
)
}
\arguments{
\item{module}{An (optional) Python module to be imported before
the REPL is launched.}

\item{quiet}{Boolean; print a startup banner when launching the REPL? If
\code{TRUE}, the banner will be suppressed.}

\item{input}{Python code to be run within the REPL. Setting this can be
useful if you'd like to drive the Python REPL programmatically.}
}
\description{
This function provides a Python REPL in the \R session, which can be used
to interactively run Python code. All code executed within the REPL is
run within the Python main module, and any generated Python objects will
persist in the Python session after the REPL is detached.
}
\details{
When working with R and Python scripts interactively, one can activate
the Python REPL with \code{repl_python()}, run Python code, and later run \code{exit}
to return to the \R console.
}
\section{Magics}{
 A handful of magics are supported in \code{repl_python()}:

Lines prefixed with \code{!} are executed as system commands:
\itemize{
\item \code{!cmd --arg1 --arg2}: Execute arbitrary system commands
}

Magics start with a \verb{\%} prefix. Supported magics include:
\itemize{
\item \verb{\%conda ...} executes a conda command in the active conda environment
\item \verb{\%pip ...} executes pip for the active python.
\item \verb{\%load}, \verb{\%loadpy}, \verb{\%run} executes a python file.
\item \verb{\%system}, \verb{!!} executes a system command and capture output
\item \verb{\%env}: read current environment variables.
\itemize{
\item \verb{\%env name}: read environment variable 'name'.
\item \verb{\%env name=val}, \verb{\%env name val}: set environment variable 'name' to 'val'.
\code{val} elements in \code{{}} are interpolated using f-strings (required Python >= 3.6).
}
\item \verb{\%cd <dir>} change working directory.
\itemize{
\item \verb{\%cd -}: change to previous working directory (as set by \verb{\%cd}).
\item \verb{\%cd -3}: change to 3rd most recent working directory (as set by \verb{\%cd}).
\item \verb{\%cd -foo/bar}: change to most recent working directory matching \code{"foo/bar"} regex
(in history of directories set via \verb{\%cd}).
}
\item \verb{\%pwd}: print current working directory.
\item \verb{\%dhist}: print working directory history.
}

Additionally, the output of system commands can be captured in a variable, e.g.:
\itemize{
\item \code{x = !ls}
}

where \code{x} will be a list of strings, consisting of
stdout output split in \code{"\\n"} (stderr is not captured).
}

\section{Example}{
\preformatted{
# enter the Python REPL, create a dictionary, and exit
repl_python()
dictionary = \{'alpha': 1, 'beta': 2\}
exit

# access the created dictionary from R
py$dictionary
# $alpha
# [1] 1
#
# $beta
# [1] 2

}
}

\seealso{
\link{py}, for accessing objects created using the Python REPL.
}
