module RVim
  module Editor

    class ViewPort
      def initialize
        @buffers = []
        @active_buffer = nil
        @status_line = nil
      end

      def buffers
        @buffers
      end

      def key_press char, screen
        return false if char == ?q

        screen.print char
        return true
      end

      def show screen
        active_buffer do |buffer|
          buffer.data.each_char do |c|
            screen.print c 
          end
        end
      end

      private
      def active_buffer(&block)
        @active_buffer ||= buffers.first

        if @active_buffer && block_given?
          yield @active_buffer
        else
          @active_buffer
        end
      end
    end

  end
end
