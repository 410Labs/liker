module Liker
  module ViewHelpers

    # Render Facebook's "Like" button, along with all Open Graph tags used by Facebook.
    def facebook_like_button(options={})
      content_for :head do
        facebook_og_tags(options)
      end

      Liker::Config.button_defaults ||= {}
      options[:button_config] ||= {}
      params = [
        ['href', CGI::escape(options[:url] || request.url)].join('='),
        ['layout', options[:button_config][:layout] || Liker::Config.button_defaults[:layout] || 'standard'].join('='),
        ['show_faces', options[:button_config][:show_faces] || Liker::Config.button_defaults[:show_faces] || false].join('='),
        ['action', options[:button_config][:action] || Liker::Config.button_defaults[:action] || 'like'].join('='),
        ['font', options[:button_config][:font] || Liker::Config.button_defaults[:font] || nil].join('='),
        ['colorscheme', options[:button_config][:colorscheme] || Liker::Config.button_defaults[:colorscheme] || 'light'].join('='),
        ['width', width = options[:button_config][:width] || Liker::Config.button_defaults[:width] || 450].join('='),
        ['height', height = options[:button_config][:height] || Liker::Config.button_defaults[:height] || 35].join('='),
        ['ref', options[:button_config][:ref] || Liker::Config.button_defaults[:ref] || nil].join('=')
      ].join('&')
      content_tag :iframe, nil, 
        :src => "http://www.facebook.com/plugins/like.php?#{params}",
        :scrolling => 'no', 
        :frameborder => '0', 
        :allowtransparency => true, 
        :class => options[:button_config][:class] || Liker::Config.button_defaults[:class] || '', 
        :style => "width:#{width}px; height:#{height}px;"
    end

    # Render all Open Graph tags used by Facebook.
    def facebook_og_tags(options={})
      Liker::Config.button_defaults ||= {}
      options[:button_config] ||= {}
      [ Liker::Config.site_name ? tag(:meta, :property => 'og:site_name', :content => Liker::Config.site_name) : nil,
        Liker::Config.page_id ? tag(:meta, :property => 'fb:page_id', :content => Liker::Config.page_id) : nil,
        og_image_tag(Liker::Config.image_url),
        # todo add fb:admins and other OG tags
        tag(:meta, :property => 'og:type', :content => options[:type] || 'article'),
        options[:title].present? ? tag(:meta, :property => 'og:title', :content => options[:title]) : nil,
        options[:description].present? ? tag(:meta, :property => 'og:description', :content => options[:description]) : nil,
        options[:url].present? ? tag(:meta, :property => 'og:url', :content => options[:url]) : nil
      ].compact.join("\n").html_safe + "\n"
    end

    # Render a single Open Graph image meta tag.
    def og_image_tag(url)
      tag(:meta, :property => 'og:image', :content => url).html_safe if url
    end

  end
end
