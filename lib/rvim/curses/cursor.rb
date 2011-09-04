module RVim
  module Curses
    
    class Cursor

      Visibility = Struct.new :type, :code

      Visibility.new :invisible, 0
      Visibility.new :visible, 1
      Visibility.new :very_visible, 2

      attr_accessor :x, :y

      def initialize
        @x = 0
        @y = 0
        @visibility = nil
      end

      def position=(coords)
        $log.debug "coords: #{coords.inspect}"
        @x = coords[0]
        @y = coords[1]
        ::Curses.setpos(@y, @x)
      end
    end

  end
end
