#!/usr/bin/env ruby -w

require 'curses'

Curses.init_screen

Curses.addstr("Hello World!");
Curses.refresh

sleep 3
Curses.close_screen
