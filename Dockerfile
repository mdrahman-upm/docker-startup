# First Block
FROM node:alpine as builder
# Install Dependencies
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Second Block
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
