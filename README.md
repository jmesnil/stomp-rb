# Server setup

add to `hornetq-configuration.xml`:

    <acceptors>
      ...
      <acceptor name="stomp">
         <factory-class>org.hornetq.core.remoting.impl.netty.NettyAcceptorFactory</factory-class>
         <param key="host"  value="${hornetq.remoting.netty.host:localhost}"/>
         <param key="port"  value="61613"/>
         <param key="protocol"  value="stomp"/>
      </acceptor>
    <acceptors>
    

and add to `hornetq-jms.xml`:

    <queue name="test">
      <entry name="/queue/test"/>
    </queue>


# Client setup

    $ bundle install --path=vendor
    # in 1 terminal
    $ bundle exec ruby consumer.rb  
    # in another terminal
    $ bundle exec ruby publisher.rb  