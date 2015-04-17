require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
	local_path = "http://localhost:3000"

	describe "GET #index" do
		it "should respond successfully with HTTP 200 code" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should render template index" do
			get :index
			expect(response).to render_template("index")
		end
	end

	describe 'Insert New book' do
	  it 'lets the user to insert usename', :js => true do
	    visit local_path + books_path
	    click_on 'New Book'
	    fill_in 'book_title', :with => 'Ruby on Rails'
	    fill_in 'book_author', :with => 'T. Savani'
	    #find('#book_user_ids').find(:css, 'option[1]').select_option
	    click_on 'Create Book'  # this be an Ajax button -- requires Selenium
	    page.should have_content('Book was successfully created.')
	  end
 	end

end
