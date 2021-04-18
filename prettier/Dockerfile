FROM node:14.16.1-alpine3.13

RUN npm install --global prettier@2.2.1 && \
    npm cache clean --force
ENTRYPOINT [ "prettier" ]
