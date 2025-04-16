FROM node:18-alpine AS build

WORKDIR /app

COPY . .
RUN npm install

RUN npm run build

FROM node:18-alpine

RUN npm install -g serve

WORKDIR /app

COPY --from=build /app/dist /app/dist

EXPOSE 80

CMD ["serve", "-s", "dist", "-l", "80"]
