module Admin
  class BaseController < ApplicationController
    before_action :authenticate!
    after_action :verify_authorized

    def index
      skip_authorization
    end
  end
end
