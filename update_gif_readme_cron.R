#!/usr/bin/Rscript

#Copyright Stephen Froehlich 2020
#https://github.com/stephenbfroehlich/

#this is the cron job to push a fresh animation to GitHub


# Regenerate README.md with fresh timestamp from the gif. -----------------

rmarkdown::render("README.Rmd")


# Git Push ----------------------------------------------------------------

system(
  glue::glue(
    'git commit -a -m "auto commit with fresh data {Sys.time()}"'
  )
)

system("git push")
