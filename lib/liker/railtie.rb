require 'liker/view_helpers'
require 'liker/config'

module Liker
  class Railtie < Rails::Railtie
    initializer 'liker' do |app|
      ActiveSupport.on_load :action_view do
        ::ActionView::Base.send :include, Liker::ViewHelpers
      end
    end
  end
end