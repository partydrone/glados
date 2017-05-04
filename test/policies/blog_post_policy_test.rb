require 'test_helper'

class BlogPostPolicyTest < ActiveSupport::TestCase
  let(:blog_post) { blog_posts(:new_blog_post) }
  let(:user) { users(:generic_user) }

  describe "for authorized user" do
    [:admin, :blog_post_manager].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :blog_post.must_permit user, :index
      end

      it "permits show" do
        blog_post.must_permit user, :show
      end

      it "permits new" do
        blog_post.must_permit user, :new
      end

      it "permits create" do
        blog_post.must_permit user, :create
      end

      it "permits edit" do
        blog_post.must_permit user, :edit
      end

      it "permits update" do
        blog_post.must_permit user, :update
      end

      it "permits destroy" do
        blog_post.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :blog_post.wont_permit user, :index
    end

    it "prohibits show" do
      blog_post.wont_permit user, :show
    end

    it "prohibits new" do
      blog_post.wont_permit user, :new
    end

    it "prohibits create" do
      blog_post.wont_permit user, :create
    end

    it "prohibits edit" do
      blog_post.wont_permit user, :edit
    end

    it "prohibits update" do
      blog_post.wont_permit user, :update
    end

    it "prohibits destroy" do
      blog_post.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :blog_post.wont_permit nil, :index
    end

    it "prohibits show" do
      blog_post.wont_permit nil, :show
    end

    it "prohibits new" do
      blog_post.wont_permit nil, :new
    end

    it "prohibits create" do
      blog_post.wont_permit nil, :create
    end

    it "prohibits edit" do
      blog_post.wont_permit nil, :edit
    end

    it "prohibits update" do
      blog_post.wont_permit nil, :update
    end

    it "prohibits destroy" do
      blog_post.wont_permit nil, :destroy
    end
  end
end
