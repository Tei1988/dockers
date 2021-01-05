FROM node:14.15.3-alpine3.12

RUN npm install --global @google/clasp@2.3.0 && \
    npm cache clean --force
ENTRYPOINT [ "clasp" ]
