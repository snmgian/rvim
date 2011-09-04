require 'curses'

module RVim
  module Curses
    class Keyboard

      def initialize
        @thread = nil
        @status = :off
      end

      def on(&block)
        if on?
          $log.warn 'Keyboard already on'
          return
        end

        unless block_given?
          $log.warn 'Block not given'
          return
        end

        @status == :off
        @thread = Thread.new do 
          begin
            char = ::Curses.getch
            continue_reading = yield char
          end while continue_reading
        end
        @thread.join
        off
      end

      def on?
        @status == :on
      end

      def off
        if off?
          $log.warn 'Keyboard already off'
          return
        end

        @thread = nil
        @status = :off
      end

      def off?
        @status == :off
      end

    end
  end
end
