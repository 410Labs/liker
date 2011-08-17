if defined?(Rails::Railtie)
  require 'liker/railtie'
elsif defined?(Rails::Initializer)
  raise "Liker is not yet compatible with Rails 2.3 and older"
end
