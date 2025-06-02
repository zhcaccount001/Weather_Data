# plumber-api/Dockerfile
FROM rstudio/plumber

COPY plumber.R /plumber.R
COPY high_model.rds /high_model.rds
COPY low_model.rds /low_model.rds

EXPOSE 8000

CMD ["plumber", "/plumber.R", "--host", "0.0.0.0", "--port", "8000"]