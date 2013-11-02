# UnderOS::Sharing

A simple API to share your content between apps. Basically a wrapper over the `UIActivityViewController`

## Usage

Add the `under-os-sharing` into your `Gemfile` then in your code you should be able to run the following

```ruby
sharing = UOS::Sharing.new
sharing.share("Message", UIImage...)
```

## Cocoapods

This package uses the cocoapods to add the `instagram` sharing functionality

```
gem install cocoapods
pod setup
gem install motion-cocapods
```

