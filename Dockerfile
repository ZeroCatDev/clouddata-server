# Use Node.js LTS (Long Term Support) version
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev

# Copy application source code and public files
COPY src ./src
COPY public ./public
COPY tsconfig.json ./

# Create logs directory
RUN mkdir -p logs

# Expose the default port
EXPOSE 9080

# Set environment variables (can be overridden)
ENV PORT=9080
ENV NODE_ENV=production

# Start the server
CMD ["node", "src/index.js"]
