class User < ActiveRecord::Base
	#attr_accessible :name, :age, :book_id
	has_and_belongs_to_many :books, join_table: :books_users

	def to_label
		"#{name}"
	end

end
