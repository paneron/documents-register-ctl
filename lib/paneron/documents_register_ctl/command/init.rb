# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class Init
        def initialize(directory)
          @directory = directory
        end

        def run
          log { "going to create a new register in #{@directory}" }
        end
      end
    end
  end
end
