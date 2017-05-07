require 'test_helper'

describe Tagging do
  let(:tagging) { Tagging.new(tag_id: tags(:advance).id, taggable_type: 'BlogPost', taggable_id: blog_posts(:new_blog_post).id) }

  it "is a valid object" do
    tagging.must_be :valid?
  end
end
