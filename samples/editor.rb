#!/usr/bin/env ruby -w

require 'curses'
require_relative '../lib/rvim/logger.rb'

RVim::Logger.init

Curses.init_screen
Curses.noecho

x, y = 0, 0
Curses.setpos(y, x)
cols, lines = Curses.cols, Curses.lines

loop do
  ch = Curses.getch
  $log.debug "getch: #{ch.class}, #{ch.inspect}"

  case ch
  when ?q
    break
  when 10 # <Enter>
    Curses.insch "\n"
    x = 0
    y += 1
    Curses.setpos(y, x)
  else
    Curses.insch ch
    Curses.doupdate
    x += 1
    if x >= cols
      x = 0
      y += 1
    end
    Curses.setpos(y, x)
  end
end

Curses.close_screen
