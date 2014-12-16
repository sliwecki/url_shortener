class HomeController < ApplicationController
  
  before_filter :preload_form
  before_filter :preload_service, only: :create

  def new; end
  
  def create
  	if @service.perform
  		render text: @service.encrypted_url
  	else
  		render :new
  	end
  end

  private

  def preload_form
  	@form = UrlForm.new(params[:form_data])
  end

  def preload_service
  	@service = UrlSaver.new(@form)
  end
end
