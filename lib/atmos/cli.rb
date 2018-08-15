require_relative '../atmos'
require_relative '../atmos/ui'
require 'clamp'
require 'sigdump/setup'

Dir.glob(File.join(File.join(__dir__, 'commands'), '*.rb')) do |f|
  require_relative "commands/#{File.basename(f).sub(/\.rb$/, "")}"
end

Dir.glob(File.join(File.join(__dir__, 'plugins'), '*.rb')) do |f|
  require_relative "plugins/#{File.basename(f).sub(/\.rb$/, "")}"
end

module Atmos

  # The command line interface to atmos
  class CLI < Clamp::Command

    include GemLogger::LoggerSupport

    def self.description
      desc = <<-DESC
        Atmos version #{Atmos::VERSION}

        Runs The atmos command line application

        e.g.

        atmos --help
      DESC
      desc.split("\n").collect(&:strip).join("\n")
    end

    option ["-d", "--debug"],
           :flag, "debug output\n",
           default: false

    option ["-c", "--[no-]color"],
           :flag, "colorize output (or not)\n (default: $stdout.tty?)"

    option ["-e", "--atmos-env"],
           'ENV', "The atmos environment\n",
           environment_variable: 'ATMOS_ENV', default: 'ops'

    def default_color?
       $stdout.tty?
    end

    option ["-l", "--[no-]log"],
           :flag, "log to file in addition to terminal (or not)\n",
           default: true


    subcommand "new", "Sets up a new atmos project",
               Atmos::Commands::New
    subcommand "generate", "Generate recipes for the repository",
               Atmos::Commands::Generate
    subcommand "bootstrap", "Init cloud provider for use with atmos",
               Atmos::Commands::Bootstrap
    subcommand "init", "Run terraform init",
               Atmos::Commands::Init
    subcommand "plan", "Run terraform plan",
               Atmos::Commands::Plan
    subcommand "apply", "Run terraform apply",
               Atmos::Commands::Apply
    subcommand "destroy", "Run terraform destroy",
               Atmos::Commands::Destroy
    subcommand "terraform", "Run all other terraform commands",
               Atmos::Commands::Terraform
    subcommand "account", "Account management commands",
               Atmos::Commands::Account
    subcommand "user", "User management commands",
               Atmos::Commands::User
    subcommand "otp", "Otp tools",
               Atmos::Commands::Otp
    subcommand "secret", "Secret management commands",
               Atmos::Commands::Secret
    subcommand "auth_exec", "Authenticated exec",
               Atmos::Commands::AuthExec
    subcommand "container", "Container tools",
               Atmos::Commands::Container

    subcommand "version", "Display version" do
      def execute
        logger.info "Atmos Version #{Atmos::VERSION}"
      end
    end

    subcommand "config", "Display expanded config for atmos_env" do
      def execute
        logger.info YAML.dump(Atmos.config.to_h)
      end
    end

    # hook into clamp lifecycle to force logging setup even when we are calling
    # a subcommand
    def parse(arguments)
      super
      if Atmos.config.nil?
        Atmos.config = Atmos::Config.new(atmos_env)
        log = Atmos.config.is_atmos_repo? && log? ? "atmos.log" : nil
        Atmos::Logging.setup_logging(debug?, color?, log)
        Atmos::UI.color_enabled = color?
        Atmos.config.plugin_manager.register_output_filter(:stdout, Atmos::Plugins::PromptNotify)
        Atmos.config.plugin_manager.load_plugins
      end
    end

  end

end
