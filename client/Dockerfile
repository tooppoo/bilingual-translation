FROM node:18.12.1

WORKDIR /client

COPY . .

RUN npx browserslist@latest --update-db
RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
