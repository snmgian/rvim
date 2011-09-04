require 'curses'
require_relative 'cursor'

module RVim
  module Curses

    class Screen

      def advance_cursor
        x, y = @cursor.x, @cursor.y
        x += 1
        if x >= columns
          x = 0
          y += 1
        end
        @cursor.position = x, y
      end

      def advance_line
        y = @cursor.y + 1
        @cursor.position = 0, y
      end

      def init
        ::Curses.init_screen
        ::Curses.noecho
        ::Curses.refresh

        @cursor = RVim::Curses::Cursor.new
      end

      def close
        ::Curses.close_screen
      end

      def columns
        ::Curses.cols
      end

      def print(char)
        $log.debug char.inspect

        if char == 10
          ::Curses.insch "\n"
          advance_line

        else
          ::Curses.insch char
          advance_cursor
        end
      end

      def rows
        ::Curses.lines
      end

      def update
        # TODO: why doupdate doesn't work?
        #::Curses.doupdate
        ::Curses.refresh
      end
    end

  end
end
