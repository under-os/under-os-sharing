# UnderOS::Sharing

A simple API to share your content between apps. Basically a wrapper over the `UIActivityViewController`

## Usage

Add the `under-os-sharing` into your `Gemfile` then in your code you should be able to run the following

```ruby
sharing = UOS::Sharing.new
sharing.share("Message", UIImage...)
```

By default this package will use all the matching services/apps that are currently registered against the iOS,
but you can limit the number of options by specifying the black list with the `:exclue` option

```ruby
sharing = UOS::Sharing.new(:exclude => %w[facebook email])
```

Or you can specify the white list with the `:receivers` option

```ruby
sharing = UOS::Sharing.new(:receivers => %w[twitter message])
```

## List of supported services

 * `instagram`
 * `facebook`
 * `twitter`
 * `flickr`
 * `vimeo`
 * `weibo` - ask apple
 * `message` - open up in the iMessage
 * `email`
 * `print`
 * `copy`
 * `contact` - open in the contacts app
 * `save` - save to the photo album (for images)
 * `reading` - add to the reading list
 * `airdrop` - share via the airdrop


## Copyright & License

All code in this repository released under the terms of the MIT license

Copyright (C) 2014 Nikolay Nemshilov
