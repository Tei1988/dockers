FROM node:14.17.3-alpine3.14

RUN npm install --global prettier@2.3.2 && \
    npm cache clean --force
ENTRYPOINT [ "prettier" ]
