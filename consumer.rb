# -*- encoding: utf-8 -*-

require 'stomp'
#
# == Example message consumer.
#
class ExampleConsumer
  # Initialize.
  def initialize
  end
  # Run example.
  def run
    client = Stomp::Client.new("stomp://guest:guest@localhost:61613")
    puts "Subscribing ronaldo"
    client.subscribe("jms.queue.test", {:ack => "client" }) do |msg|
    puts msg.body
  
    client.acknowledge(msg)
  end

  loop do
    sleep(1)
    puts "."
  end
  end
end
#
e = ExampleConsumer.new
e.run
