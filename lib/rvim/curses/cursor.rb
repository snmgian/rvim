module RVim
  module Curses
    
    class Cursor

      Visibility = Struct.new :type, :code

      Visibility.new :invisible, 0
      Visibility.new :visible, 1
      Visibility.new :very_visible, 2

      def initialize
        @x = nil
        @y = nil
        @visibility = nil
      end
    end

  end
end
