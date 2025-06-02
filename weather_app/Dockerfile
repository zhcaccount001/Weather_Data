FROM rocker/shiny

COPY app.R /srv/shiny-server/
RUN chown -R shiny:shiny /srv/shiny-server

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]