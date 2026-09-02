FROM rocker/binder:4.6.1
LABEL maintainer='ChristianMuellerKett'
COPY --chown=${NB_USER} . ${HOME}
USER ${NB_USER}



RUN wget https://github.com/RaumanalysenChristianMueller/R_Analyst/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2026-09-02/')); devtools::install_deps()"

RUN rm DESCRIPTION.1; exit 0
