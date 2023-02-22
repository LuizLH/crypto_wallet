class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Rails 5.x - Jackson [COOKIE]"
    session[:curso] = "Curso de Rails 5.x - Jackson [SESSION]"
    @nome  = params[:nome]
    @curso = params[:curso] 
  end
end
