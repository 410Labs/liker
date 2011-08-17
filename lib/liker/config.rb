require 'active_support/core_ext/class/attribute_accessors'

module Liker
  class Config
    cattr_accessor :site_name, :page_id, :image_url, :button_defaults
  end
end