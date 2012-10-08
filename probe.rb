
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
ZIP_FILENAME = "#{ SUBFOLDER }.zip"
PING_FILENAME = 'ping.txt'
TRACEROUTE_FILENAME = 'traceroute.txt'
RESULT_PATH = "#{ FOLDER }/#{ SUBFOLDER }"

`mkdir #{ RESULT_PATH }`

def ping url
  `ping -a -c 50 #{ url } > #{ RESULT_PATH }/#{ url }-#{ PING_FILENAME }`
end
def traceroute url
  `traceroute -e -S #{ url } > #{ RESULT_PATH }/#{ url }-#{ TRACEROUTE_FILENAME }`
end
def zip
  `cd #{ FOLDER }; zip #{ ZIP_FILENAME } #{ SUBFOLDER }/*`
end

puts "Probing... (takes few minutes)"
HOSTS.each do |host|
  puts " @ #{ host }"
  ping host if PING
  traceroute host if TRACEROUTE
end

puts "Packing #{ ZIP_FILENAME }..."
zip

puts "Done."
