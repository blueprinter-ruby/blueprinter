# frozen_string_literal: true

module Blueprinter
  module TypeHelpers
    private
    def active_record_relation?(object)
      !!(defined?(ActiveRecord::Relation) &&
        object.is_a?(ActiveRecord::Relation))
    end

    def array_like_class?(object)
      Blueprinter.configuration.array_like_classes.any? do |klass|
        object.is_a?(klass)
      end
    end

    def array_like?(object)
      object.is_a?(Array) || active_record_relation?(object) || array_like_class?(object)
    end
  end
end
