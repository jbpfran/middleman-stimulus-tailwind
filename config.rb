$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/helpers")

# Helpers
# helpers are in the helpers directory at the project root
require "markdown_helpers"
helpers MarkdownHelpers
require "locale_helpers"
helpers LocaleHelpers

# Strapi integration
# example of a strapi integration based on httparty
#require "event"

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions


# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Setting HAML as default templating language
set :haml, { :format => :html5 }
Haml::TempleEngine.disable_option_validator!
set :frontmatter_extensions, %w(.html .haml)

activate :i18n, :mount_at_root => false, :langs => [:en, :fr]


# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
#activate :relative_assets

activate :external_pipeline,
 name: :webpack,
 command: build? ? 'yarn run build' : 'yarn run start',
 source: ".tmp/dist",
 latency: 1

config[:css_dir] = 'assets/stylesheets'
config[:js_dir] = 'assets/javascripts'
#config[:images_dir] = 'images'

# Dynamic Pages
# this is where I put the templates for dynamic pages
ignore 'dynamic/*'

# Example using Strapi as a CMS to build pages
#Event.find_all_published.each do |event|
#  proxy "/events/#{event.slug}.html", "/templates/event_template.html", locals: {event: event}
#end

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

activate :metaman, host: 'https://yourwebsite.com'

# Dev environment
configure :development do
 activate :livereload
 activate :images
end

# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :autoprefixer do |prefix|
    prefix.browsers = "last 2 versions"
  end
    
  # minification is handled by the external pipeline so you don't need to activate them
  #activate :minify_css
  #activate :minify_javascript
  
  activate :images do |images|
    # Do not include original images in the build (default: false)
    images.ignore_original = true

    # Specify another cache directory depending on your root directory (default: 'cache')
    images.cache_dir = 'cache'

    # Optimize images (default: false)
    images.optimize = true

    # Provide additional options for image_optim
    # See https://github.com/toy/image_optim for all available options
    images.image_optim = {
      nice: 20,
      optipng: {
        level: 5,
      },
    }
  end
  
  activate :asset_hash, :rewrite_ignore => [/[.](?:html|haml)$/]
  
  # Compression of files, if you activate it don't forget to activate it in you nginx (or web server)
  #activate :gzip
  
  # to manage the robots.txt file
  #activate :robots, 
  #  rules: [
  #    { user_agent: '*', allow: %w[/] }
  #  ],
  #  sitemap: 'https://example.com/sitemap.xml'
end