require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	local_path = "http://localhost:3000"

	describe 'Create new user' do
	  it 'lets the user to insert usename', :js => true do
	    visit local_path + root_path
	    click_on 'New User'
	    fill_in 'user_name', :with => 'T. Savani'
	    fill_in 'user_age', :with => '25'
	    click_on 'Create User'  # this be an Ajax button -- requires Selenium
	    page.should have_content('User was successfully created.')
	  end
 	end
end