# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class Rm
        def initialize(_data_pathfiles)
          @data_path = data_path
        end

        def run
          log { "going to remove in #{@data_path}" }
        end
      end
    end
  end
end
