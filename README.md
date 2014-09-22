# Ruby Goroutine

Goroutines are a concurrency primitive in go.  They enable firing off asynchronus
jobs in an efficient way.
There are a few implementations of goroutines for Ruby, however none of them add
anything new except instead of doing `Thread.new { some_method }` they do `go { some_method }`.
But goroutinues are so much more than new threads to run some piece of code.

1. Lightweight - Goroutines are more like Ruby Fibers than Threads.
2. Scheduling - Goroutines are automatically scheduleled across a set of worker
threads, and not new threads in and of themselves.
3. No callback Async IO - all of Go's IO is asyncronous and used without
callbacks. The goroutine workers handle the switching for the async IO
autoamtically.

These other goroutines libraries also tend to have an implementation of Go's
channels.  While channels are awesome, they aren't neccessary for implementing
goroutines, and as such are not implemented here.

## Implentation

This library takes advantage of all the great work of [Celluloid::IO](https://github.com/celluloid/celluloid-io).
If you want details on how this is implemented, you should look at the
Celluloid::IO link above.

Cellulid::IO implements duck types of many of the Ruby IO libraries.  These are
implemented with asyncronous IO that can be used without callbacks.  If you are
using this library with any IO, you should use the Celluloid::IO duck type so
the goroutine workers are not blocked by IO.

## Usage

```ruby
require 'go-scheduler'

def some_long_running_method
  sleep 5
  "some data"
end

# Fire and forget
go { some_long_running_method }

# Get return value
foo = go { some_long_running_method } # returns instantly
foo.ready? #=> false
foo.value # Blocks until done and returns method data
```
You can pass any callable object to `go`, so a proc, a block, a method, etc.

## Hacking
Got Docker? Use the provided Dockerfile.
This will put you into an IRB console just `require 'go-scheduler'`
