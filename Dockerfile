FROM ruby:2.1
RUN gem install celluloid celluloid-io
RUN mkdir -p /opt/goroutine
ADD . /opt/goroutine/
WORKDIR /opt/goroutine
CMD [ "irb", "-I", "/opt/goroutine/lib" ]
