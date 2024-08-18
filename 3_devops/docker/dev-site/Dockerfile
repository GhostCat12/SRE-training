FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
ENV cohort=396
RUN sed -i "s/<COHORT>/$cohort/g" /usr/local/apache2/htdocs/*
EXPOSE 8080
CMD ["httpd-foreground"]

