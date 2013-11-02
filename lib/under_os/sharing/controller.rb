module UnderOs
  class Sharing
    def controller_for(items)
      UIActivityViewController.alloc.tap do |controller|
        controller.initWithActivityItems(items, applicationActivities: custom_activities)
        controller.excludedActivityTypes = excluded_activities
      end
    end

    def custom_activities
      [].tap do |activities|
        CUSTOM_RECEIVERS.each do |key, receiver|
          activities << receiver.alloc.init if receivers_include(key)
        end
      end
    end

    def excluded_activities
      [].tap do |activities|
        NATIVE_RECEIVERS.each do |key, receiver|
          activities << receiver unless receivers_include(key)
        end
      end
    end

    def receivers_include(key)
      if @options.has_key?(:receivers)
        @options[:receivers].map(&:to_sym).incude?(key)
      elsif @options.has_key?(:exclude)
        ! @options[:exclude].map(&:to_sym).include?(key)
      else
        true # fallback to inclusion
      end
    end

    CUSTOM_RECEIVERS = {
      instagram: UnderOs::Sharing::Instagram
    }

    NATIVE_RECEIVERS = {
      facebook: UIActivityTypePostToFacebook,
      twitter:  UIActivityTypePostToTwitter,
      flickr:   UIActivityTypePostToFlickr,
      vimeo:    UIActivityTypePostToVimeo,
      weibo:    UIActivityTypePostToWeibo,
      message:  UIActivityTypeMessage,
      email:    UIActivityTypeMail,
      print:    UIActivityTypePrint,
      copy:     UIActivityTypeCopyToPasteboard,
      contact:  UIActivityTypeAssignToContact,
      save:     UIActivityTypeSaveToCameraRoll,
      reading:  UIActivityTypeAddToReadingList,
      airdrop:  UIActivityTypePostToTencentWeibo
    }
  end
end
