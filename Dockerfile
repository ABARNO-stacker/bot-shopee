FROM node:18-slim
RUN apt-get update && apt-get install -y chromium-browser --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
CMD ["npm", "start"]
