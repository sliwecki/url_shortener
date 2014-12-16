require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET new' do
    specify do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    specify do
      post :create, form_data: { url: 'http://www.google.pl' }
      expect(response).to have_http_status(:ok)
    end

    specify do
      post :create, form_data: { url: 'www.google.pl' }
      expect(response).to render_template(:new)
    end
  end
end
