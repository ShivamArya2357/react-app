FROM node:16.4.2 as builder
WORKDIR '/app'
COPY package.json .
RUN npx npm-check-updates
RUN npx npm-check-updates -u
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

