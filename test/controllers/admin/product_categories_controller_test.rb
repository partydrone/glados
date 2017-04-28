require 'test_helper'

describe Admin::ProductCategoriesController, :locale do
  let(:product_category) { product_categories(:intersection) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_product_categories_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_product_category_path
      must_respond_with :success
    end

    it "creates a product category" do
      hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      icon_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_product_categories_path, params: {
          product_category: {
            name: 'System One',
            position: '4',
            product_type_id: product_types(:detection).id,
            hero_image: {
              id: hero_image.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: hero_image.size
            }.to_json,
            icon_image: {
              id: icon_image.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: icon_image.size
            }.to_json
          }
        }
      }.must_change 'ProductCategory.count'
      flash[:notice].wont_be_nil
      must_redirect_to admin_product_categories_path
    end

    # it "gets show" do
    #   get admin_product_category_path(product_category)
    #   must_respond_with :success
    # end

    it "gets edit" do
      get edit_admin_product_category_path(product_category)
      must_respond_with :success
    end

    it "updates a product category" do
      patch admin_product_category_path(product_category), params: {
        product_category: {
          name: product_category.name
        }
      }
      must_redirect_to admin_product_categories_path
    end

    it "destroys a product category" do
      -> {
        delete admin_product_category_path(product_category)
      }.must_change 'ProductCategory.count', -1
      must_redirect_to admin_product_categories_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_product_categories_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_product_category_path
      must_redirect_to sign_in_path
    end

    it "won't create a product category" do
      hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      icon_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_product_categories_path, params: {
          product_category: {
            name: 'System One',
            position: '4',
            product_type_id: product_types(:detection).id,
            hero_image: {
              id: hero_image.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: hero_image.size
            }.to_json,
            icon_image: {
              id: icon_image.id,
              filename: 'shark.jpg',
              content_type: 'image/jpeg',
              size: icon_image.size
            }.to_json
          }
        }
      }.wont_change 'ProductCategory.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_product_category_path(product_category)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_product_category_path(product_category)
      must_redirect_to sign_in_path
    end

    it "won't update a product category" do
      patch admin_product_category_path(product_category), params: {
        product_category: {
          name: product_category.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a product category" do
      -> {
        delete admin_product_category_path(product_category)
      }.wont_change 'ProductCategory.count', -1
      must_redirect_to sign_in_path
    end
  end
end
