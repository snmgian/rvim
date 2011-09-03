#!/usr/bin/env ruby -w

# looking at Curses.cols 
# return the number of columns in the current screen
#
# Curses.lines
# return the number of lines in the current screen

require 'curses'

Curses.init_screen

puts Curses.cols
puts Curses.lines

sleep 3
Curses.close_screen


