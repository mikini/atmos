require_relative '../atmos'
require_relative '../atmos/generator'
require 'tmpdir'
require 'fileutils'
require 'git'
require 'open-uri'
require 'zip'

module SimplyGenius
  module Atmos

    class GeneratorFactory
      include GemLogger::LoggerSupport

      def self.create(sourcepaths, **opts)
        expanded_sourcepaths = expand_sourcepaths(sourcepaths)
        klass = Class.new(Generator) do
          source_paths.concat(expanded_sourcepaths)
        end

        g = klass.new([], **opts)
        return g
      end

      def self.expand_sourcepaths(sourcepaths)
        expanded_sourcepaths = []
        sourcepaths.each do |sourcepath|

          if sourcepath =~ /(\.git)|(\.zip)(#.*)?$/

            logger.debug("Using archive sourcepath")

            tmpdir = Dir.mktmpdir("atmos-templates-")
            at_exit { FileUtils.remove_entry(tmpdir) }

            template_subdir = ''
            if sourcepath =~ /([^#]*)#([^#]*)/
              sourcepath = Regexp.last_match[1]
              template_subdir = Regexp.last_match[2]
              logger.debug("Using archive subdirectory for templates: #{template_subdir}")
            end

            if sourcepath =~ /.git$/

              begin
                logger.debug("Cloning git archive to tmpdir")

                g = Git.clone(sourcepath, 'atmos-checkout', depth: 1, path: tmpdir)
                local_template_path = File.join(g.dir.path, template_subdir)

                expanded_sourcepaths << local_template_path
                logger.debug("Using git sourcepath: #{local_template_path}")
              rescue => e
                logger.log_exception(e, level: :debug)
                logger.warn("Could not read from git archive, ignoring sourcepath: #{sourcepath}")
              end

            elsif sourcepath =~ /.zip$/

              begin
                logger.debug("Cloning zip archive to tmpdir")

                open(sourcepath, 'rb') do |io|
                  Zip::File.open_buffer(io) do |zip_file|
                    zip_file.each do |f|
                      fpath = File.join(tmpdir, f.name)
                      f.extract(fpath)
                    end
                  end
                end

                local_template_path = File.join(tmpdir, template_subdir)
                expanded_sourcepaths << local_template_path
                logger.debug("Using zip sourcepath: #{local_template_path}")
              rescue => e
                logger.log_exception(e, level: :debug)
                logger.warn("Could not read from zip archive, ignoring sourcepath: #{sourcepath}")
              end

            end

          else

            logger.debug("Using local sourcepath: #{sourcepath}")
            expanded_sourcepaths << sourcepath

          end

        end

        return expanded_sourcepaths
      end

    end

  end
end
