# just a gem hook
require 'under-os'

UnderOs.extend __FILE__ do |app|
  app.resources_dirs << File.dirname(__FILE__) + "/../resources"
end
