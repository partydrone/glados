module Admin
  class UsersController < BaseController
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = User.order(:last_name, :first_name)
      authorize @users
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: %(Updated "#{@user.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: %(Deleted "#{@user.name}" successfully.)
    end

    private

    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, { role_ids: [] })
    end
  end
end
