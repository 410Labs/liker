# liker

Jonathan Julian - 410 Labs

A gem to generate a Facebook Like button on your page, along with proper Open Graph meta tags.

Open Graph meta tags go into the head of your page.
The Facebook Like button goes where it is placed.

_Currently only compatible with Rails 3.x._

## Usage
Make sure you `yield :head` in your template between the `<head></head>` tags (or else you won't get the OG tags).
Add the Facebook Like button wherever you'd like to to appear on the page.

    <%= facebook_like_button %>

This method takes a few options:

* `:url` - The URL to share as `og:url` (if nil, the current url will be used in the iframe call, and the OG tag will be omitted)
* `:type` - The Open Graph object type `og:type`; defaults to `article`
* `:title` - The title of the item; if nil, the OG tag will be omitted
* `:description` - The description of the item; if nil, the OG tag will be omitted
* `:button_config` - a hash of config options documented [here](https://developers.facebook.com/docs/reference/plugins/like/)
    * `:layout`
    * `:show_faces`
    * `:action`
    * `:font`
    * `:colorscheme`
    * `:width`
    * `:height`
    * `:ref`
    * `:class` - a css class (or classes) to apply to the iframe

## Configuration

Setting these configuration parameters in your app will cause liker to create the corresponding Open Graph tags along with
the others. These generally will not change across your entire site.

    Liker::Config.site_name        = 'MySite'                             # og:site_name
    Liker::Config.page_id          = '<facebook page id>'                 # fb:page_id
    Liker::Config.image_url        = 'http://example.com/my-avatar.png'   # og:image

In addition, you can specify default Facebook Like button attributes to apply to every button created. A passed `:button_config` always 
overrides the `button_defaults`.

    Liker::Config.button_defaults  = {<default values for :button_config>}

## Further Reading
* Facebook's page on [Open Graph protocol](https://developers.facebook.com/docs/opengraph/)
* The Facebook [Like Button](https://developers.facebook.com/docs/reference/plugins/like/)


## TODO

* Get tests running
* Add Rails 2.3.x compatibility (for replyz.com)

## Contributing to liker
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 410 Labs. See LICENSE.txt for
further details.

