FROM rocker/binder:latest
LABEL maintainer='Christian Mueller-Kett'

COPY --chown=${NB_USER} . ${HOME}
USER ${NB_USER}

RUN R -e "options(repos = c(CRAN = 'https://packagemanager.posit.co/cran/2026-09-01')); \
          install.packages(c('sf', 'openxlsx', 'dplyr', 'ggplot2', 'ggthemes', 'showtext', 'ggrepel', 'leaflet', 'knitr', 'tidyverse', 'rmarkdown', 'kableExtra'))"