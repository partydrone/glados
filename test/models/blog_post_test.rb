require 'test_helper'

describe BlogPost do
  let(:blog_post) { BlogPost.new(title: 'Post Title', author: 'Jack Reacher', body: 'Post body text.', posted_on: Date.yesterday.to_s(:db)) }

  it "is a valid object" do
    blog_post.must_be :valid?
  end

  it "requires an author" do
    blog_post.author = ' '
    blog_post.wont_be :valid?
  end
end
