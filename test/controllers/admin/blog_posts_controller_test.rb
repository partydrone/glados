require 'test_helper'

describe Admin::BlogPostsController, :locale do
  let(:blog_post) { blog_posts(:new_blog_post) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :blog_post_manager
      end

      it "gets index" do
        get admin_blog_posts_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_blog_post_path
        must_respond_with :success
      end

      it "creates a blog post" do
        hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        -> {
          post admin_blog_posts_path, params: {
            blog_post: {
              title: 'System One',
              subtitle: 'Meet the new memeber of the Wavetronix family.',
              author: 'Dan Levitan',
              body: 'System one has been five years in the making, and it is totally worth the wait!',
              posted_on: Date.today.to_s(:db),
              hero_image: {
                id: hero_image.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: hero_image.size
              }.to_json
            }
          }
        }.must_change 'BlogPost.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_blog_post_path(BlogPost.last)
      end

      it "gets show" do
        get admin_blog_post_path(blog_post)
        must_respond_with :success
      end

      it "gets edit" do
        get edit_admin_blog_post_path(blog_post)
        must_respond_with :success
      end

      it "updates a blog post" do
        patch admin_blog_post_path(blog_post), params: {
          blog_post: {
            title: blog_post.title
          }
        }
        must_redirect_to admin_blog_post_path(blog_post)
      end

      it "destroys a blog post" do
        -> {
          delete admin_blog_post_path(blog_post)
        }.must_change 'BlogPost.count', -1
        must_redirect_to admin_blog_posts_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_blog_posts_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_blog_post_path
        must_redirect_to root_path
      end

      it "won't create a blog post" do
        hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        -> {
          post admin_blog_posts_path, params: {
            blog_post: {
              title: 'System One',
              subtitle: 'Meet the new memeber of the Wavetronix family.',
              author: 'Dan Levitan',
              body: 'System one has been five years in the making, and it is totally worth the wait!',
              posted_on: Date.today.to_s(:db),
              hero_image: {
                id: hero_image.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: hero_image.size
              }.to_json
            }
          }
        }.wont_change 'BlogPost.count'
        must_redirect_to root_path
      end

      it "prohibits show" do
        get admin_blog_post_path(blog_post)
        must_redirect_to root_path
      end

      it "prohibits edit" do
        get edit_admin_blog_post_path(blog_post)
        must_redirect_to root_path
      end

      it "won't update a blog post" do
        patch admin_blog_post_path(blog_post), params: {
          blog_post: {
            title: blog_post.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a blog post" do
        -> {
          delete admin_blog_post_path(blog_post)
        }.wont_change 'BlogPost.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenicated user" do
    it "prohibits index" do
      get admin_blog_posts_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_blog_post_path
      must_redirect_to sign_in_path
    end

    it "won't create a blog post" do
      hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_blog_posts_path, params: {
          blog_post: {
            title: 'System One',
            subtitle: 'Meet the new memeber of the Wavetronix family.',
            author: 'Dan Levitan',
            body: 'System one has been five years in the making, and it is totally worth the wait!',
            posted_on: Date.today.to_s(:db),
            hero_image: {
              id: hero_image.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: hero_image.size
            }.to_json
          }
        }
      }.wont_change 'BlogPost.count'
      must_redirect_to sign_in_path
    end

    it "prohibits show" do
      get admin_blog_post_path(blog_post)
      must_redirect_to sign_in_path
    end

    it "prohibits edit" do
      get edit_admin_blog_post_path(blog_post)
      must_redirect_to sign_in_path
    end

    it "won't update a blog post" do
      patch admin_blog_post_path(blog_post), params: {
        blog_post: {
          title: blog_post.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a blog post" do
      -> {
        delete admin_blog_post_path(blog_post)
      }.wont_change 'BlogPost.count', -1
      must_redirect_to sign_in_path
    end
  end
end
