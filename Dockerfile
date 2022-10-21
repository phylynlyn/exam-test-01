FROM node:10 as build
ENV PORT 3000



COPY . /app
WORKDIR /app
RUN npm ci
RUN rm -rf /bin/sh



FROM gcr.io/distroless/nodejs-debian11:18
COPY --from=build /app /app
WORKDIR /app
EXPOSE 3000
CMD [ "app.js" ]