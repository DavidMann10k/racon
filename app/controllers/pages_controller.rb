class PagesController < ApplicationController
  def index
  end

  def secret
    authenticate_user!
    respond_to do |format|
      format.html
      format.json {
        render json: { response: "This is the secret sauce!" }, status: 200
      }
    end
  end
end
