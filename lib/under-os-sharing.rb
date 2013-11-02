# just a gem hook

Motion::Project::App.instance_eval do
  alias :setup_before_under_os_sharing :setup

  def setup(*args, &block)
    config.setup_blocks << proc do |app|
      Dir.glob(File.dirname(__FILE__) + '/**/*.rb').reverse.each do |file|
        app.files.insert(0, file) if file != __FILE__
      end
    end

    setup_before_under_os_sharing *args do |app|
      app.resources_dirs << File.dirname(__FILE__) + "/../resources"

      instance_exec app, &block
    end
  end
end
