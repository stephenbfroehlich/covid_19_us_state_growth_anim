#!/usr/bin/Rscript

#Copyright Stephen Froehlich 2020
#https://github.com/stephenbfroehlich/


# Generate a fresh gif ----------------------------------------------------

source("track_graph.R", local = TRUE)



# Regenerate README.md with fresh timestamp from the gif. -----------------

rmarkdown::render("README.Rmd")


# Git Push ----------------------------------------------------------------

