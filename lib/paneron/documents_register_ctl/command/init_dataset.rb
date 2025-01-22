# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class InitDataset
        def initialize(directory)
          @directory = directory
        end

        def run
          log { "going to create a new dataset in #{@directory}" }
        end
      end
    end
  end
end
