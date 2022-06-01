FROM ruby:3.0.3-buster

ARG RAILS_ENV=production
ARG SKIP_ENV_VALIDATION=true
ARG SECRET_KEY_BASE

ENV RUBYOPT='-W0' \
    RAILS_ENV=$RAILS_ENV

COPY . .

RUN gem install bundler -v '~>2.3.3' && bundle config set deployment 'true'

RUN bundle install

RUN [ -z ${SECRET_KEY_BASE} ] \
    && echo '⚠️ SECRET_KEY_BASE NOT PRESENT' || echo '✅ SECRET_KEY_BASE PRESENT'

EXPOSE 3001

CMD ["bundle", "exec", "rails db:create && rails db:migrate && bundle exec rackup -s puma -p 3001"]