# frozen_string_literal: true

module Paneron
  module Cli
    module Command
      class SetAdd
        def initialize(key, value)
          @key = key
          @value = value
        end

        def run
          log { "adding value to key, #{@key} => #{@value}" }
        end
      end
    end
  end
end
