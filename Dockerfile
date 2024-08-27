FROM ruby:3.1.0
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV APP=/var/www

# RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    # build-essential \
    # openssh-server \
    sudo \
    # cmake \
    # locales \
    # graphviz \
    # libssl-dev \
    # htop \
    # libpq-dev \
    # default-mysql-client \
    postgresql-client
    # default-libmysqlclient-dev \
    # libgdbm-dev \
    # libmagic-dev \
    # imagemagick \
    # poppler-utils \
    # nano \
    # pdftk

# RUN locale-gen en_US.UTF-8 && \
  # localedef -c -i en_US -f UTF-8 en_US.UTF-8
# ENV LANG=en_US.UTF-8 \
  # LANGUAGE=en_US:en \
  # LC_ALL=en_US.UTF-8

# skip installing gem documentation
# RUN sudo chmod -R 777 /usr/local/bundle && mkdir -p /usr/local/etc && { echo 'install: --no-document'; echo 'update: --no-document'; } >> /usr/local/etc/gemrc

RUN adduser ruby
RUN adduser ruby sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir $APP

# Node 14.x install
#RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
#RUN sudo apt -y install nodejs

# RUN sudo curl -LO https://nodejs.org/dist/v20.13.0/node-v20.13.0-linux-x64.tar.xz
# RUN sudo tar -xvf node-v20.13.0-linux-x64.tar.xz
# RUN sudo cp -r node-v20.13.0-linux-x64/{bin,include,lib,share} /usr/

# Yarn install
# RUN sudo npm i -g yarn

# Install dependencies
# RUN yarn

USER ruby

WORKDIR $APP

COPY . .

RUN sudo chown -R ruby $APP
RUN sudo chown -R ruby  /usr/local/bundle

# GEM
# RUN echo "gem: --no-document" > ~/.gemrc
# RUN gem install nokogiri -v 1.16.0
# RUN gem install rdoc:3.12.2
# RUN gem install pagseguro-oficial:2.6.0
# RUN gem install public_suffix -v 4.0.7
# RUN gem install twitter:5.9.0

# RUN git config --global --add safe.directory /var/www

# RUN gem install bundler -v 2.5.5
#RUN bundle install

# Expose ports.
EXPOSE 3000
# EXPOSE 9200
# EXPOSE 9292
# EXPOSE 3035
# EXPOSE 3036

CMD /bin/bash
