module Admin
  class RolesController < BaseController
    before_action :set_role, only: [:edit, :update, :destroy]

    def index
      @roles = Role.order(:name)
    end

    def new
      @role = Role.new
    end

    def edit
    end

    def create
      @role = Role.new(role_params)
      if @role.save
        redirect_to admin_roles_path, notice: %(Saved "#{@role.name}" successfully.)
      else
        render :new
      end
    end

    def update
      if @role.update(role_params)
        redirect_to admin_roles_path, notice: %(Updated "#{@role.name}" successfully.)
      else
        render :edit
      end
    end

    def destroy
      @role.destroy
      redirect_to admin_roles_path, notice: %(Deleted "#{@role.name}" successfully.)
    end

    private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name)
    end
  end
end
