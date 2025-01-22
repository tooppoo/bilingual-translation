FROM node:18.20.6@sha256:eb37f58646a901dc7727cf448cae36daaefaba79de33b5058dab79aa4c04aefb

WORKDIR /client

COPY . .

RUN npx browserslist@latest --update-db
RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
