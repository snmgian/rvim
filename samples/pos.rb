#!/usr/bin/env ruby -w

# looking at Curses.setpos
# it receives two arguments
# Curses.setpos(y, x)
# set the cursor the position (x, y)
# y = row
# x = column

require 'curses'

Curses.init_screen

Curses.setpos(5, 20)
Curses.addstr("Hello World!");

Curses.setpos(6, 20)
Curses.addstr("Hello World!");
Curses.refresh

sleep 3
Curses.close_screen

