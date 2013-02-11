# -*- encoding: utf-8 -*-

require 'stomp'
#
# == Example message publisher
#
class ExamplePublisher
  # Initialize.
  def initialize
  end
  # Run example.
  def run
    client = Stomp::Client.new("stomp://guest:guest@localhost:61613")
    message = "ronaldo #{ARGV[0]}"

    for i in (1..10)
      puts "Sending message"
      client.publish("jms.queue.test", "#{i}: #{message}", {:persistent => true})
      puts "(#{Time.now})Message sent: #{i}"
      sleep 0.2
    end
  end
end
#
e = ExamplePublisher.new
e.run
