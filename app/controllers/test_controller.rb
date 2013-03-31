class TestController < ApplicationController
  @@counter = 0
  @@mutex = Mutex.new

  def index
    @@mutex.synchronize do
      counter = @@counter
      sleep 1
      counter += 1
      @@counter = counter
    end
    render text: "#{@@counter}"
  end

  def threads
    i = 0
    t1 = Thread.new do
      1_000_000.times do
        i += 1
      end
    end
    t2 = Thread.new do
      1_000_000.times do
        i += 1
      end
    end
    t1.join
    t2.join
    render text: i
  end
end