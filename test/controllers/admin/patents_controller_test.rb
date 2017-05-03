require 'test_helper'

describe Admin::PatentsController, :locale do
  let(:patent) { patents(:vehicular_traffic_sensor) }

  describe "with authenticated user" do
    let(:user) { users(:generic_user) }

    before do
      sign_in user
    end

    describe "who is authorized" do
      before do
        user.add_role :patent_manager
      end
      
      it "gets index" do
        get admin_patents_path
        must_respond_with :success
      end

      it "gets new" do
        get new_admin_patent_path
        must_respond_with :success
      end

      it "creates a patent" do
        -> {
          post admin_patents_path, params: {
            patent: {
              number: '5345',
              title: 'The room where it happens'
            }
          }
        }.must_change 'Patent.count'
        flash[:notice].wont_be_nil
        must_redirect_to admin_patents_path
      end

      # it "gets show" do
      #   get admin_patent_path(patent)
      #   must_respond_with :success
      # end

      it "gets edit" do
        get edit_admin_patent_path(patent)
        must_respond_with :success
      end

      it "updates a patent" do
        patch admin_patent_path(patent), params: {
          patent: {
            title: patent.title
          }
        }
        must_redirect_to admin_patents_path
      end

      it "destroys a patent" do
        -> {
          delete admin_patent_path(patent)
        }.must_change 'Patent.count', -1
        must_redirect_to admin_patents_path
      end
    end

    describe "who is not authorized" do
      it "prohibits index" do
        get admin_patents_path
        must_redirect_to root_path
      end

      it "prohibits new" do
        get new_admin_patent_path
        must_redirect_to root_path
      end

      it "won't create a patent" do
        -> {
          post admin_patents_path, params: {
            patent: {
              number: '5345',
              title: 'The room where it happens'
            }
          }
        }.wont_change 'Patent.count'
        must_redirect_to root_path
      end

      # it "prohibits show" do
      #   get admin_patent_path(patent)
      #   must_redirect_to root_path
      # end

      it "prohibits edit" do
        get edit_admin_patent_path(patent)
        must_redirect_to root_path
      end

      it "won't update a patent" do
        patch admin_patent_path(patent), params: {
          patent: {
            title: patent.title
          }
        }
        must_redirect_to root_path
      end

      it "won't destroy a patent" do
        -> {
          delete admin_patent_path(patent)
        }.wont_change 'Patent.count', -1
        must_redirect_to root_path
      end
    end
  end

  describe "without authenticated user" do
    it "prohibits index" do
      get admin_patents_path
      must_redirect_to sign_in_path
    end

    it "prohibits new" do
      get new_admin_patent_path
      must_redirect_to sign_in_path
    end

    it "won't create a patent" do
      -> {
        post admin_patents_path, params: {
          patent: {
            number: '5345',
            title: 'The room where it happens'
          }
        }
      }.wont_change 'Patent.count'
      must_redirect_to sign_in_path
    end

    # it "prohibits show" do
    #   get admin_patent_path(patent)
    #   must_redirect_to sign_in_path
    # end

    it "prohibits edit" do
      get edit_admin_patent_path(patent)
      must_redirect_to sign_in_path
    end

    it "won't update a patent" do
      patch admin_patent_path(patent), params: {
        patent: {
          title: patent.title
        }
      }
      must_redirect_to sign_in_path
    end

    it "won't destroy a patent" do
      -> {
        delete admin_patent_path(patent)
      }.wont_change 'Patent.count', -1
      must_redirect_to sign_in_path
    end
  end
end
