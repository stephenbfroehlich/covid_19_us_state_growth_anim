COVID-19 Growth Animation - U.S. States
================

The fight against COVID-19 in the United States is generally coordinated and administered at the state level with the federal government mainly providing resources. As such, each state's response to COVID-19 has differed significantly from that of others. The question is if any are doing a better job than others.

This anmation, inspired by Aatish Bhatia's version based on the [Johns Hopkins Data](https://github.com/CSSEGISandData/COVID-19) at <https://aatishb.com/covidtrends/>. As Johns Hopkins has stopped tracking U.S. State-level data, I instead am pulling that from the [COVID Tracking Project](https://covidtracking.com/)'s very simple and easy-to-use API, which provides a handy JSON download.

If you're here already, you should also check out Datawrapper's excellent [17 (or so) responsible live visualizations about the coronavirus, for you to use](https://blog.datawrapper.de/coronaviruscharts/) page.

Current Animations
------------------

![](covid_growth_anim.gif)

<font size="1">*Last updated at 2020-03-31 06:07:06 MDT.*</font>

This plot visualizes **infections driving more infections**, and the main take-away is that ***we're all in this together***.

As of March 28, only Washington State (WA) appears to have had any significant impact on the COVID-19 growth rate, though Massachusetts was doing well for a while. The latest datum from New York starts to look encouraging.

 

![](covid_death_p_anim.gif)

<font size="1">*Last updated at 2020-03-31 06:07:06 MDT.*</font>

This plot visualizes **infections driving deaths**.

For interpretation when the data are noisy like this, remember that it is low *slope* that is good more than low *position* ... though the first does eventually lead to the second. As long as positive test result numbers are rising ... *higher slope is better* for this plot. It means either better testing of patients or less deaths per infection.

 

Social Media-sized gif
----------------------

For now I am only sharing a social-media sized gif for the "COVID-19 Infections by State" as that's the only one with a clear, compelling narrative at the moment. When do you post, please link back to <https://github.com/stephenbfroehlich/covid_19_us_state_growth_anim> or <https://git.io/Jv7YM> so that people can get updated data as it comes out and also see the data provenance - just right-click, copy, and paste. For Twitter, LinkedIn and possibly others save the gif locally and upload it as a photo to get the gif to work.

![](covid_growth_anim_sm.gif)

 

How to Read These Charts
------------------------

Basically, we're looking for a state to depart the diagonal line downward, which means that it has exited the exponential growth phase. For more detail, see the following video from **minutephysics**: <https://youtu.be/54XLXg4fYsc>

 

Code
----

-   `README.Rmd` is the primary script. It both writes out the various gifs but is also the Rmarkdown document used to generate the GitHub README.
-   `covid_*_anim.gif` is each full-sized animation.
-   `covid_*_anim_sm.gif` is each social media-sized animation.
-   `update_gif_readme_cron.R` is the script called by the cron job that updates this page ... it renders `README.Rmd` into `README.md`, including with fresh gifs and then pushes the update to GitHub.

 

Appendix - Hospitalization Animations
=====================================

The [COVID Tracking Project](https://covidtracking.com/) is only able to get hospitalizations for some states. As a result as of March 28, it is hard to draw any conclusions from these visualizations, but they may become more telling over time.

### Infections Driving Hospitalizations

![](covid_hosp_anim.gif)

<font size="1">*Last updated at 2020-03-31 06:07:06 MDT.*</font>

It would be surprising if this animation showed any ovbious trends that would indicate any home remidies were driving reduced hospitalizations per infection. Instead, the most likely driver of differences is likely to be age differences in the newly-infected populations.

### Hospitalizations Driving Deaths

![](covid_death_h_anim.gif)

<font size="1">*Last updated at 2020-03-31 06:07:06 MDT.*</font>

Again, for interpretation when the data are noisy like this, remember that it is low *slope* that is good more than low *position*. However, any decrease in slope over time indicate that health systems are getting better at preventing deaths. Any increases in slope mean that treatments are becoming less effective for some reason.
