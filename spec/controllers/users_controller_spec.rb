require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'index' do
    it 'should respond successfully with HTTP 200 code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should render template index' do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'create new user' do
    it 'should create new user' do
      user = {name: 'Saurabh', age: 25}
      post :create, user: user
      expect(response).to have_http_status(302)
      expect(response).to redirect_to user_path(User.all.last)
    end
  end

end