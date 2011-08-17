require 'helper'

class TestLiker < ActionView::TestCase
  include Liker::ViewHelpers

  def test_facebook_like_button
    assert_equal '', facebook_like_button
  end
  def test_facebook_og_tags
    tag_str = facebook_og_tags
    assert_match /property="og:type"/, tag_str
    assert_match /content="article"/, tag_str
  end
  def test_og_image_tag
    url = 'http://example.com/image.png'
    tag_str = og_image_tag(url)
    assert_match /property="og:image"/, tag_str
    assert_match /content="#{url}"/, tag_str
  end
end
