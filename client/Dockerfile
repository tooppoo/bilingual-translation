FROM node:19.0.0

WORKDIR /client

COPY . .

RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
