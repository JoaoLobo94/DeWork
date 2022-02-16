FROM ubuntu:latest

WORKDIR /app

# Update default packages
RUN apt-get update -qq && \
 apt-get install -y build-essential openssl libssl-dev nodejs-legacy less vim libsasl2-dev

# Get Ubuntu packages
RUN apt-get install -y \
    build-essential \
    curl

# Update new packages
RUN apt-get update

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

RUN rustup default nightly

RUN cargo install cargo-watch && cargo install cross

RUN gem install bundler -v 1.17.3