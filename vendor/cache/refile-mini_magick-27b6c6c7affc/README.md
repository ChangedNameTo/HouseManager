# Refile::MiniMagick

Image processing for Refile using MiniMagick.

## Installation

```ruby
gem 'refile-mini_magick'
```

Note that the master branch switched to using the [ImageProcessing] gem, which
actively fixes the bugs reported on this repo, so it's recommended to pull
refile-mini_magick from master:

```rb
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
```

## Usage

The following processing helpers are provided for Refile:

* /attachments/:token/:backend\_name**/convert/jpg**/:id
* /attachments/:token/:backend\_name**/limit/500/500**/:id
* /attachments/:token/:backend\_name**/fit/500/500**/:id
* /attachments/:token/:backend\_name**/fill/500/500**/:id
* /attachments/:token/:backend\_name**/pad/500/500**/:id
* /attachments/:token/:backend\_name**/resample/500/500**/:id

Refile::MiniMagick internally delegates to [ImageProcessing] dependency gem, so
you can read documentation about these processing actions on that repository.

## Contributing

1. Fork it ( https://github.com/refile/refile-mini_magick/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[ImageProcessing]: https://github.com/janko-m/image_processing
