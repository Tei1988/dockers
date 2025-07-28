ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN npm install --global @google/clasp@2.4.2 && \
    npm cache clean --force && \
    sed -i /usr/local/lib/node_modules/@google/clasp/build/src/auth.js -e 's/listen(/listen(process.env.CLASP_AUTH_PORT || /'
ENTRYPOINT [ "clasp" ]
