FROM node:10.15.3-alpine as builder

WORKDIR /app
COPY . /app

RUN yarn install \
       && yarn build


FROM nginx:1.15
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build/ /usr/share/nginx/html/
EXPOSE 80