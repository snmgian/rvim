module RVim
  module Editor

    class Buffer

      attr_accessor :data

      def initialize(name = nil, data = '')
        @name = name
        @data = data
      end
    end

  end
end
