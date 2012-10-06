
PING = true
TRACEROUTE = true

PLACES = %w{
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
  system "ping -c 5 #{ url } > #{ FOLDER }/#{ SUBFOLDER }/#{ url }-ping.txt"
end
def traceroute url
  system "traceroute -e -S #{ url } > #{ FOLDER }/#{ SUBFOLDER }/#{ url }-traceroute.txt"
end
def zip
  system "cd #{ FOLDER }; zip #{ SUBFOLDER }.zip #{ SUBFOLDER }/*"
end

puts "Probing... (takes few minutes)"
PLACES.each do |place|
  puts " @ #{ place }"
  ping place if PING
  traceroute place if TRACEROUTE
end

puts "Packing..."
zip

puts "Done."
