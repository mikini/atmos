require_relative '../atmos'
require 'active_support/core_ext/class'

Dir.glob(File.join(File.join(__dir__, 'plugins'), '*.rb')) do |f|
  require_relative "plugins/#{File.basename(f).sub(/\.rb$/, "")}"
end

module SimplyGenius
  module Atmos

    class Plugin
      include GemLogger::LoggerSupport

      attr_reader :config

      def initialize(config)
        @config = config
      end

      def register_output_filter(type, clazz)
        Atmos.config.plugin_manager.register_output_filter(type, clazz)
      end

    end

  end
end
