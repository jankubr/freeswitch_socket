require 'socket'
class FreeswitchSocket
  
  def initialize
    @socket = TCPSocket.open("#{FREESWITCH_HOST}", 8021)
    authenticate
  end

private  

  def authenticate
    @socket.gets
    @socket.gets
    command("auth #{FREESWITCH_PASSWORD}")
  end
  
  def command(cmd)
    @socket.send("#{cmd}\n\n", 1024)
    @socket.gets
    @socket.gets
    @socket.gets        
  end
  
end