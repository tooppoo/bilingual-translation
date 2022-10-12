FROM node:16.17.1

WORKDIR /client

COPY . .

RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
