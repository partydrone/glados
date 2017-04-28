require 'test_helper'

describe Admin::ProductTypesController, :locale do
  let(:product_type) { product_types(:detection) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    it "gets index" do
      get admin_product_types_path
      must_respond_with :success
    end

    it "gets new" do
      get new_admin_product_type_path
      must_respond_with :success
    end

    it "creates a Product Type" do
      hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      icon_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_product_types_path, params: {
          product_type: {
            name: 'System One',
            position: '4',
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
      }.must_change 'ProductType.count'
      flash[:notice].wont_be_nil
      must_redirect_to admin_product_types_path
    end

    # it "gets show" do
    #   get admin_product_type_path(product_type)
    #   must_respond_with :success
    # end

    it "gets edit" do
      get edit_admin_product_type_path(product_type)
      must_respond_with :success
    end

    it "updates a Product Type" do
      patch admin_product_type_path(product_type), params: {
        product_type: {
          name: product_type.name
        }
      }
      must_redirect_to admin_product_types_path
    end

    it "destroys a Product Type" do
      -> {
        delete admin_product_type_path(product_type)
      }.must_change 'ProductType.count', -1
      must_redirect_to admin_product_types_path
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_product_types_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_product_type_path
      must_redirect_to sign_in_path
    end

    it "won't create a Product Type" do
      hero_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      icon_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
      -> {
        post admin_product_types_path, params: {
          product_type: {
            name: 'System One',
            position: '4',
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
      }.wont_change 'ProductType.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_product_type_path(product_type)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_product_type_path(product_type)
      must_redirect_to sign_in_path
    end

    it "won't update a Product Type" do
      patch admin_product_type_path(product_type), params: {
        product_type: {
          name: product_type.name
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a Product Type" do
      -> {
        delete admin_product_type_path(product_type)
      }.wont_change 'ProductType.count', -1
      must_redirect_to sign_in_path
    end
  end
end
