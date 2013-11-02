module UnderOs
  class Sharing
    class Interaction
      def initialize(uti)
        @uti = uti
      end

      def open(url, annotation=nil, &block)
        @callback   = block
        @root_view  = UnderOs::App.navigation._.visibleViewController.view

        @controller = UIDocumentInteractionController.interactionControllerWithURL(url)
        @controller.annotation = annotation if annotation
        @controller.delegate = self
        @controller.setUTI @uti
        @controller.presentOpenInMenuFromRect @root_view.frame, inView: @root_view, animated: true
      end

      def documentInteractionController(controller, willBeginSendingToApplication: application)
        @callback.call(true)
      end
    end
  end
end
