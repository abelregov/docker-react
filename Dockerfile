FROM node:alpine
# For PROD Deployment
#FROM node:alpine as builder

WORKDIR '/app'
# COPY package.json .
COPY package*.json ./

RUN yarn install
COPY . .
RUN yarn run build
 
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# For PROD Deployment
#COPY --from=builder /app/build /usr/share/nginx/html