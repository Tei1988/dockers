FROM node:14.17.1-alpine3.13

RUN npm install --global @google/clasp@2.4.0 && \
    npm cache clean --force
ENTRYPOINT [ "clasp" ]
