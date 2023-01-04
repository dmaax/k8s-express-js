# Use nodejs based on alpine as builder
FROM node:18.12.1-alpine3.17 as builder

# Set the environment to production
ENV NODE_ENV=production

# Use /app as the work directory
WORKDIR /app

# COPY dependencies
COPY ["package.json", "package-lock.json*", "./"]

# Install dependencies
USER 0
RUN npm ci --production

# Copy the app
USER node
COPY src/. .

FROM node:18.12.1-alpine3.17

USER node
COPY --from=builder /app /app
WORKDIR /app

# Start the app
CMD ["node", "index.mjs"]