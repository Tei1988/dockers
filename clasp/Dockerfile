FROM node:18.13.0-alpine3.17

RUN npm install --global @google/clasp@2.4.2 && \
    npm cache clean --force
ENTRYPOINT [ "clasp" ]
