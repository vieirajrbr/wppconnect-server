FROM node:22.15.0-alpine as builder
WORKDIR /usr/src/app

# Clona o repositório oficial e instala as dependências
RUN apk add git && \
    git clone https://github.com/wppconnect-team/wppconnect-server.git . && \
    yarn install --ignore-engines && \
    yarn build

FROM node:22.15.0-alpine
WORKDIR /usr/src/app

RUN apk update && \
    apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    yarn \
    udev \
    bash \
    curl \
    git \
    python3 \
    make \
    g++ \
    vips-dev \
    fftw-dev

COPY --from=builder /usr/src/app .

ENV PORT=3010 \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

EXPOSE 3010

CMD ["yarn", "start"]