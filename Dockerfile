FROM ruby:2.1
RUN mkdir -p /opt/goroutine
ADD . /opt/goroutine/
WORKDIR /opt/goroutine
RUN bundle install
CMD [ "irb", "-I", "/opt/goroutine/lib" ]
