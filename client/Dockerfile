FROM node:16.17.0

WORKDIR /client

COPY . .

RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
