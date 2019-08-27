FROM node:8.11.4 AS build

WORKDIR /app/website

EXPOSE 3000 35729
COPY ./docs /app/docs
COPY ./website /app/website
RUN yarn install
RUN yarn build

FROM bitnami/nginx:latest as release

COPY --from=build /app/website/build/nikio /app
