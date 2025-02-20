# frozen_string_literal: true

module Paneron
  module Cli
    module Command
      class Ls
        def initialize(data_path, **opts)
          @data_path = data_path
          @opts = opts
        end

        def run
          log { "showing 'files' in #{@data_path}, with #{@opts}" }
        end
      end
    end
  end
end
