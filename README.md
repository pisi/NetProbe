Network Fitness Probe
=====================

> **There are no proper words to describe how much my current wireless
> internet connection sucks.** Frankly, the situation is far from ideal -
> the provider's antenna is 858 meters from mine and did I mention
> the huge leaf tree some 30 meters from mine directly in the line
> of sight? Signal is good, but sometimes there are nearly 80% losses.

In an attempt to help the provider guys diagnose the occasional losses
of connectivity and tune up the connection, I've scribbled this little
[Ruby][ruby] probe, which I run on my OSX stack to automate this process
for me. It takes a list of domains, runs network diagnostics command(s)
for each of them and dumps outputs into a timestamped subfolder
of [`results/`][results], which is then ZIPped up for better transport.

    $ ruby probe.rb

The results subfolder can also optionally be tagged with an argument.

-- _[Petr Vostřel][pisi], 2012_


[ruby]:http://ruby-lang.org
[pisi]:http://petr.vostrel.cz
[results]:NetProbe/tree/master/results
