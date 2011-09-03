require 'logger'

module RVim
  module Logger

    def self.init
      if defined?($log)
        $log.warn 'Logger already initalized'
        return
      end

      $log = ::Logger.new(File.new('development.log', 'a+'))
      $log.debug('--- Logger initialized')
    end
  end
end
