module Admin
  class IdentitiesController < BaseController
    def new
      @identity = request.env['omniauth.identity']
    end

    def authentication_failure
      redirect_to sign_in_path, alert: params[:message].humanize
    end
  end
end
