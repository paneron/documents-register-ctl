# frozen_string_literal: true

module Paneron
  module RegisterCtl
    module Command
      class LsVersions
        def initialize(data_path)
          @data_path = data_path
        end

        def run
          log { "showing versions of #{@data_path}" }
        end
      end
    end
  end
end
