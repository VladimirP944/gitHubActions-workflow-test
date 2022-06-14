FROM node
LABEL authors="Codecooler"

RUN apt-get update \
    && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install

RUN npm ci --only=production

COPY . /app

EXPOSE 5000

CMD [ "node", "index.js"]



