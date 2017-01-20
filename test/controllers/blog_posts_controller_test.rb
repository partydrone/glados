require 'test_helper'

describe BlogPostsController, :locale do
  it "gets show" do
    get blog_post_path(blog_posts(:new_blog_post))
    must_respond_with :success
  end
end
