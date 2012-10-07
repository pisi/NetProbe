
PING = true
TRACEROUTE = true

HOSTS = %w{
  www.bezdrat.net
  gmail.com
  skype.com
  rychlost.cz
  svitavy.cz
  seznam.cz
  members.iracing.com
}

TAG = ARGV[0]
SUBFOLDER = "#{ Time.now.strftime "%Y-%m-%d-%H-%M" }#{ "-#{ TAG }" if TAG }"
FOLDER = 'results'

system "mkdir #{ FOLDER }/#{ SUBFOLDER }"

def ping url
  system "ping -c 50 #{ url } > #{ FOLDER }/#{ SUBFOLDER }/#{ url }-ping.txt"
end
def traceroute url
  system "traceroute -e -S #{ url } > #{ FOLDER }/#{ SUBFOLDER }/#{ url }-traceroute.txt"
end
def zip
  system "cd #{ FOLDER }; zip #{ SUBFOLDER }.zip #{ SUBFOLDER }/*"
end

puts "Probing... (takes few minutes)"
HOSTS.each do |host|
  puts " @ #{ host }"
  ping host if PING
  traceroute host if TRACEROUTE
end

puts "Packing..."
zip

puts "Done."
