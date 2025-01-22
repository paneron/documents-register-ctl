# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class Ls
        def initialize(data_path)
          @data_path = data_path
        end

        def run
          log { "showing 'files' in #{@data_path}" }
        end
      end
    end
  end
end
