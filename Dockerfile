FROM ruby:2.4.3-stretch
RUN apt-get update -qq \
  && apt-get install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    wget \
  && wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
  && wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && echo "deb https://deb.nodesource.com/node_9.x zesty main" >> /etc/apt/sources.list.d/nodesource.list \
  && apt-get update -qq \
  && apt-get install -y \
    libpq-dev \
    nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists

RUN mkdir /opt/app
WORKDIR /opt/app
ENV BUNDLE_PATH /var/gems

COPY ./Gemfile* /opt/app/
RUN bundle check || bundle install
