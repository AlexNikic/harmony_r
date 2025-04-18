% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generate_crosswalk_table.R
\name{generate_crosswalk_table}
\alias{generate_crosswalk_table}
\title{Generate Crosswalk Table Function}
\usage{
generate_crosswalk_table(
  instruments,
  similarity,
  threshold,
  is_allow_within_instrument_matches = FALSE,
  is_enforce_one_to_one = FALSE
)
}
\arguments{
\item{instruments}{The original list of instruments, each containing a question. The sum of the number of questions in all instruments is the total number of questions which should equal both the width and height of the similarity matrix.}

\item{similarity}{The cosine similarity matrix from Harmony}

\item{threshold}{The minimum threshold that we consider a match. This is applied to the absolute match value. So if a question pair has similarity 0.2 and threshold = 0.5, then that question pair will be excluded. Leave as None if you don't want to apply any thresholding.}

\item{is_allow_within_instrument_matches}{Defaults to False. If this is set to True, we include crosswalk items that originate from the same instrument, which would otherwise be excluded by default.}

\item{is_enforce_one_to_one}{Defaults to False.  If this is set to True, we force all variables in the crosswalk table to be matched with exactly one other variable.}
}
\value{
A crosswalk table as a DataFrame.
}
\description{
Generate a crosswalk table for a list of instruments, given the similarity matrix that came out of the match function.
A crosswalk is a list of pairs of variables from different studies that can be harmonised.
}
\examples{
\donttest{
instrument_A = create_instrument_from_list(list(
  "How old are you?",
  "What is your gender?"
))

instrument_B = create_instrument_from_list(list(
  "Do you smoke?"
))

instruments = list(instrument_A, instrument_B)

match_response = match_instruments(instruments)
instrument_list = match_response$instruments
similarity_matrix = match_response$matches

crosswalk_table.df = generate_crosswalk_table(
  instrument_list, similarity_matrix, threshold = 0.7,
  is_allow_within_instrument_matches = FALSE, is_enforce_one_to_one = TRUE
)

}

}
\author{
Alex Nikic
}
