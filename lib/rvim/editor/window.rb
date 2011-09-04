require_relative '../curses/screen'

module RVim
  module Editor

    class Window
      attr_accessor :keyboard

      def initialize
        @view_port = nil
        @screen = RVim::Curses::Screen.new
        @keyboard = nil
      end

      def attach view_port
        @view_port = view_port
      end

      def close
        @screen.close
      end

      def show
        @screen.init
        @view_port.show(@screen) if @view_port
        @screen.update
      end

      def you_are_the_boss
        @keyboard.on do |char|
          @view_port.key_press char, @screen
        end
      end

    end
  end
end
