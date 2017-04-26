module Admin
  class BaseController < ApplicationController
    before_action :authenticate!

    def index
    end
  end
end
