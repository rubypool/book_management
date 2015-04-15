class Book < ActiveRecord::Base
	#attr_accessible :title, :author, :user_id
	has_and_belongs_to_many :users, join_table: :books_users
end