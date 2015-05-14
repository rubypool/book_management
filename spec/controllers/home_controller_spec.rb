require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

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

end
