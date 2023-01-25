FROM node:18.13.0-alpine3.17

RUN npm install --global prettier@2.8.3 && \
    npm cache clean --force
ENTRYPOINT [ "prettier" ]
