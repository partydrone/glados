class SessionsController < ApplicationController
  skip_before_action :set_locale, only: [:create]

  def new
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies[:auth_token] = {
      value: user.auth_token,
      expires: 30.days.from_now
    }
    uri = session[:referer]
    session[:referer] = nil
    if uri
      redirect_to uri
    else
      redirect_to root_path
    end
  end

  def destroy
    cookies.delete :auth_token
    redirect_to root_url
  end
end
