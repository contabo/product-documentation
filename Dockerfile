FROM node:24-bookworm-slim

ARG HUGO_VERSION=0.163.3

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN ARCH=$(dpkg --print-architecture) && \
    wget -O /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${ARCH}.deb \
    && dpkg -i /tmp/hugo.deb \
    && rm /tmp/hugo.deb

RUN npm install -g sass

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

EXPOSE 1313

CMD ["hugo", "server", "--disableFastRender", "--noHTTPCache", "--bind", "0.0.0.0"]
