FROM php:7.4-cli as builder
WORKDIR /app
COPY . /app
# RUN curl -sS https://getcomposer.org/installer | php
# RUN php composer.phar install --no-dev
RUN echo "Instruction build" >> demo.txt 

FROM php:7.4-cli
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 80
CMD ["php", "-S", "0.0.0.0:80"]