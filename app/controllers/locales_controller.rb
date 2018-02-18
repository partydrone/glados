class LocalesController < ApplicationController
  def set_locale
    redirect_to root_path(locale: params[:new_locale])
  end
end
