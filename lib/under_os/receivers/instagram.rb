module UnderOs
  class Sharing
    class Instagram < UIActivity
      def activityType
        "com.under-os.share.instagram"
      end

      def activityTitle
        "Instagram"
      end

      def activityImage
        UIImage.imageNamed("instagram.png")
      end

      def canPerformWithActivityItems(items)
        instagram_installed? && items.each do |item|
          if item_is_large_enough_image?(item)
            return true
          end
        end

        false
      end

      def prepareWithActivityItems(items)
        items.each do |item|
          @image_title = item if item.is_a?(String)
          @image_url   = save(item) if item.is_a?(UIImage)
        end
      end

      def performActivity
        return activityDidFinish(false) if ! @image_url

        @image_title = {"InstagramCaption" => @image_title} if @image_title

        @interaction = UnderOs::Sharing::Interaction.new("com.instagram.exclusivegram")
        @interaction.open @image_url, @image_title do |result|
          activityDidFinish result
        end
      end

    private

      def instagram_installed?
        UIApplication.sharedApplication.canOpenURL(NSURL.URLWithString("instagram://app"))
      end

      def item_is_large_enough_image?(item)
        item.is_a?(UIImage) && item.size.height >= 612 && item.size.width >= 612
      end

      def save(image)
        image_data = UIImageJPEGRepresentation(scale(image), 1.0)
        filename   = NSTemporaryDirectory().stringByAppendingPathComponent("instagram.igo")
        NSURL.fileURLWithPath(filename) if image_data.writeToFile(filename, atomically:true)
      end

      def scale(image)
        size      = UOS::Point.new(x: 640, y: 640)
        ratio     = size.x / image.size.width
        new_size  = CGSizeMake(size.x, image.size.height * ratio)
        offset_x  = (size.x - new_size.width)/2
        offset_y  = (size.y - new_size.height)/2

        UIGraphicsBeginImageContext(CGSizeMake(size.x, size.y))
        context   = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, UIColor.whiteColor.CGColor)
        CGContextFillRect(context, CGRectMake(0,0,size.x, size.y))
        image.drawInRect(CGRectMake(offset_x,offset_y,new_size.width,new_size.height))
        new_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        new_image
      end
    end
  end
end
