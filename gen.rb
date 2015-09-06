#!/usr/bin/env ruby

require 'open-uri'

url = 'http://lichess1.org/assets/compiled/lichess.lobby.min.js'
data = open(url).read

data.sub!(/.=.\?13:14,.*?slice.*?slice.*?;/) {|m|
    m[10..-1].sub(/\.slice\(.*?\)/, '.slice(0)').sub(/\)\.slice[^;]*/, ')') +
        "$('#start_buttons').css('vertical-align','top');"
}

File.open('lichess.lobby.min.js', 'w') {|f| f.puts(
"// This file is a slightly modified version of <#{url}>.
// I claim no copyright or ownership of any sort to the code that follows.
#{data}")
}
