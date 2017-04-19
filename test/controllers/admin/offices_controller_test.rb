require 'test_helper'

describe Admin::OfficesController, :locale do
  let(:office) { offices(:new_office) }

  it "gets index" do
    get admin_offices_path
    must_respond_with :success
  end

  it "gets new" do
    get new_admin_office_path
    must_respond_with :success
  end

  it "creates a office" do
    -> {
      post admin_offices_path, params: {
        office: {
          name: 'NOAA',
          city: 'Sitka'
        }
      }
    }.must_change 'Office.count'
    flash[:notice].wont_be_nil
    must_redirect_to admin_offices_path
  end

  it "gets show" do
    get admin_office_path(office)
    must_respond_with :success
  end

  it "gets edit" do
    get edit_admin_office_path(office)
    must_respond_with :success
  end

  it "updates a office" do
    patch admin_office_path(office), params: {
      office: {
        name: office.name
      }
    }
    must_redirect_to admin_office_path(office)
  end

  it "destroys a office" do
    -> {
      delete admin_office_path(office)
    }.must_change 'Office.count', -1
    must_redirect_to admin_offices_path
  end
end
