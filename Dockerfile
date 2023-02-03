# Use a imagem Node.js como base
FROM node:14 as angular

# Defina o diretório de trabalho como /app
WORKDIR /app

RUN git clone -b master https://marcelocdl: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@github.com/marcelocdl/teste-docker

WORKDIR /app/teste-docker

COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Compile o projeto Angular
RUN npm run build

FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=angular app/dist/teste-docker /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf