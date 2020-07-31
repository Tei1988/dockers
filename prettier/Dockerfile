FROM node:14.7.0-alpine3.12

RUN npm install --global prettier@2.0.5 && \
    npm cache clean --force
ENTRYPOINT [ "prettier" ]
