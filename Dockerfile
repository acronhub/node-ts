FROM node:10-alpine

ENV APP_ROOT /app/

# install curl, python tooling and other utilities
RUN apk add --update curl python-dev py-pip gpgme maven openjdk8 && pip install --upgrade pip && \
	rm -rf /var/cache/apk/*

# install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | sh
ENV PATH /root/.yarn/bin:$PATH


WORKDIR $APP_ROOT

COPY package*.json $APP_ROOT
RUN yarn install

# その他ファイルをコピー。
COPY . $APP_ROOT
