FROM node:18.12.1

WORKDIR /client

COPY . .

RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
