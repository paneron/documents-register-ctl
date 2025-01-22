# frozen_string_literal: true

module Paneron
  module DocumentsRegisterCtl
    module Command
      class Set
        def initialize(key, value)
          @key = key
          @value = value
        end

        def run
          log { "setting key value, #{@key} => #{@value}" }
        end
      end
    end
  end
end
