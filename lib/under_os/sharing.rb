module UnderOs
  class Sharing
    VERSION = '1.0.2'

    def initialize(options={})
      @options = options
    end

    def share(*objects, &block)
      controller = controller_for(items_from(objects))
      UnderOs::App.history.current_page._
        .presentViewController(controller, animated: true, completion: block)
    end

    def items_from(objects)
      objects
    end
  end
end
