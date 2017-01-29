module Admin
  class UsersController < BaseController
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
