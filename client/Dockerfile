FROM node:18.11.0

WORKDIR /client

COPY . .

RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
