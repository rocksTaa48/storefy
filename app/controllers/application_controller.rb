class ApplicationController < ActionController::Base

  include Pagy::Backend
  def not_found
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
    end
  end

end
