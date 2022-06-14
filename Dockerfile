FROM node
LABEL authors="Codecooler"

RUN apt-get update \
    && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install \
    && ncu -u \
    && npm install

RUN npm ci --only=production

COPY ../javascript /app

EXPOSE 5000

CMD [ "node", "index.js"]


