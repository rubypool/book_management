require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

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

	describe 'create' do
    it 'should create book with users' do
      user = User.create(name: 'Saurabh', age: 26)
      book = {title: 'Ruby on rails', author: 'Aaron P', user_ids: ["#{user.id}"]}
      post :create, :book => book
      expect(response).to have_http_status(302)
      expect(response).to redirect_to book_path(Book.all.last)
    end
 	end

  describe 'show' do
    it 'should show book details' do
      user = User.create(name: 'Saurabh', age: 26)
      book = Book.create(title: 'Ruby', author: 'Terence Lee', user_ids: ["#{user.id}"])
      get :show, id: book
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
  end

end
