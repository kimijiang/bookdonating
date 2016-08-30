class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :donee, foreign_key: "donee_id", class_name: :User

	
	has_attached_file :image, :style => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def donated?
		self.donee
	end

	def donated_to? (user)
		donee_id == user.id
	end

end
