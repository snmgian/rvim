#!/usr/bin/env ruby -w

require 'curses'

Curses.init_screen
Curses.noecho
#Curses.crmode

Curses.addstr("Hello World!");
Curses.refresh

loop do
  case ch = Curses.getch
  when ?q
    break
  else
    Curses.insch ch
  end
  #sleep 0.1
end

Curses.close_screen
