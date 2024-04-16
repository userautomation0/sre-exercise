FROM node:20-bullseye as build
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /build_temp

COPY package* ./
RUN npm ci --include=dev
COPY . ./

FROM node:20-bullseye-slim
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

EXPOSE 8080
WORKDIR /app
COPY --chown=node:node --from=build /build_temp/node_modules ./node_modules
COPY --chown=node:node --from=build /build_temp/*.js ./
#COPY --chown=node:node --from=build /build_temp/dist ./dist
CMD [ "node", "app.js" ]
USER node

