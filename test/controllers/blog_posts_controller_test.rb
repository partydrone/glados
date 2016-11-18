require 'test_helper'

describe BlogPostsController, :locale do
  let(:blog_post) { blog_posts(:new_blog_post) }

  it "gets index" do
    get blog_posts_path
    must_respond_with :success
  end

  it "gets new" do
    get new_blog_post_path
    must_respond_with :success
  end

  it "creates a blog post" do
    -> {
      post blog_posts_path, params: {
        blog_post: {
          title: 'System One',
          subtitle: 'Meet the new memeber of the Wavetronix family.',
          author: 'Dan Levitan',
          body: 'System one has been five years in the making, and it is totally worth the wait!',
          posted_on: Date.today.to_s(:db)
        }
      }
    }.must_change 'BlogPost.count'
    flash[:notice].wont_be_nil
    must_redirect_to blog_post_path(BlogPost.last)
  end

  it "gets show" do
    get blog_post_path(blog_post)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_blog_post_path(blog_post)
    must_respond_with :success
  end

  it "updates a blog post" do
    patch blog_post_path(blog_post), params: {
      blog_post: {
        title: blog_post.title
      }
    }
    must_redirect_to blog_post_path(blog_post)
  end

  it "destroys a blog post" do
    -> {
      delete blog_post_path(blog_post)
    }.must_change 'BlogPost.count', -1
    must_redirect_to blog_posts_path
  end
end
