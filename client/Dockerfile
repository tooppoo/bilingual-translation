FROM node:18.12.1@sha256:e9ad817b0d42b4d177a4bef8a0aff97c352468a008c3fdb2b4a82533425480df

WORKDIR /client

COPY . .

RUN npx browserslist@latest --update-db
RUN yarn install --frozen-lockfile

CMD ["yarn", "generate"]
