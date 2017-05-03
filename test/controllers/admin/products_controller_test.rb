require 'test_helper'

module Admin
  describe ProductsController, :locale do
    let(:product) { products(:smartsensor_hd) }

    describe "with authenticated user" do
      let(:user) { users(:generic_user) }

      before do
        sign_in user
      end

      describe "who is authorized" do
        before do
          user.add_role :product_manager
        end

        it "gets index" do
          get admin_products_path
          must_respond_with :success
        end

        it "gets new" do
          get new_admin_product_path
          must_respond_with :success
        end

        it "creates a product" do
          hero_image    = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
          product_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
          -> {
            post admin_products_path, params: {
              product: {
                name: 'System One',
                part_number: '500-0001',
                expired_on: '',
                summary: 'System One summary',
                description: 'System One description.',
                product_category_id: product_categories(:arterial).id,
                hero_image: {
                  id: hero_image.id,
                  filename: 'shark.jpg',
                  content_type: 'image/jpeg',
                  size: hero_image.size
                }.to_json,
                product_image: {
                  id: product_image.id,
                  filename: 'shark.jpg',
                  content_type: 'image/jpeg',
                  size: product_image.size
                }.to_json
              }
            }
          }.must_change 'Product.count'
          flash[:notice].wont_be_nil
          must_redirect_to admin_product_categories_path
        end

        it "gets show" do
          skip "TODO: Fix missing partial bug"
          get admin_product_path(product)
          must_respond_with :success
        end

        it "gets edit" do
          get edit_admin_product_path(product)
          must_respond_with :success
        end

        it "updates a product" do
          patch admin_product_path(product), params: {
            product: {
              name: product.name
            }
          }
          must_redirect_to admin_product_path(product)
        end

        it "destroys a product" do
          -> {
            delete admin_product_path(product)
          }.must_change 'Product.count', -1
          must_redirect_to admin_products_path
        end
      end

      describe "who is not authorized" do
        it "prohibits index" do
          get admin_products_path
          must_redirect_to root_path
        end

        it "prohibits new" do
          get new_admin_product_path
          must_redirect_to root_path
        end

        it "won't create a product" do
          hero_image    = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
          product_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
          -> {
            post admin_products_path, params: {
              product: {
                name: 'System One',
                part_number: '500-0001',
                expired_on: '',
                summary: 'System One summary',
                description: 'System One description.',
                product_category_id: product_categories(:arterial).id,
                hero_image: {
                  id: hero_image.id,
                  filename: 'shark.jpg',
                  content_type: 'image/jpeg',
                  size: hero_image.size
                }.to_json,
                product_image: {
                  id: product_image.id,
                  filename: 'shark.jpg',
                  content_type: 'image/jpeg',
                  size: product_image.size
                }.to_json
              }
            }
          }.wont_change 'Product.count'
          must_redirect_to root_path
        end

        it "prohibits show" do
          get admin_product_path(product)
          must_redirect_to root_path
        end

        it "prohibits edit" do
          get edit_admin_product_path(product)
          must_redirect_to root_path
        end

        it "won't update a product" do
          patch admin_product_path(product), params: {
            product: {
              name: product.name
            }
          }
          must_redirect_to root_path
        end

        it "won't destroy a product" do
          -> {
            delete admin_product_path(product)
          }.wont_change 'Product.count', -1
          must_redirect_to root_path
        end
      end
    end

    describe "without authenticated user" do
      it "prohibits index" do
        get admin_products_path
        must_redirect_to sign_in_path
      end

      it "prohibits new" do
        get new_admin_product_path
        must_redirect_to sign_in_path
      end

      it "won't create a product" do
        hero_image    = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        product_image = Refile::Backend::FileSystem.new('tmp/uploads/cache').upload fixture_file_upload('files/shark.jpg')
        -> {
          post admin_products_path, params: {
            product: {
              name: 'System One',
              part_number: '500-0001',
              expired_on: '',
              summary: 'System One summary',
              description: 'System One description.',
              product_category_id: product_categories(:arterial).id,
              hero_image: {
                id: hero_image.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: hero_image.size
              }.to_json,
              product_image: {
                id: product_image.id,
                filename: 'shark.jpg',
                content_type: 'image/jpeg',
                size: product_image.size
              }.to_json
            }
          }
        }.wont_change 'Product.count'
        must_redirect_to sign_in_path
      end

      it "prohibits show" do
        get admin_product_path(product)
        must_redirect_to sign_in_path
      end

      it "prohibits edit" do
        get edit_admin_product_path(product)
        must_redirect_to sign_in_path
      end

      it "won't update a product" do
        patch admin_product_path(product), params: {
          product: {
            name: product.name
          }
        }
        must_redirect_to sign_in_path
      end

      it "won't destroy a product" do
        -> {
          delete admin_product_path(product)
        }.wont_change 'Product.count', -1
        must_redirect_to sign_in_path
      end
    end
  end
end
