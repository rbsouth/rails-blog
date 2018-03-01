class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	before_save :set_default_image
	def set_default_image
		if self.profile_picture.nil?
			self.profile_picture = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoHJ8UPczwkdjEgvCYSQ4TKRsCe4orkTg35k1vNLKlSIknhPcV"
		end
	end

	validates :email, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, uniqueness: true, length: {minimum: 5, maximum: 15}
	validates :password, presence: true, length: {minimum: 5}

	scope :last_3_days, -> {
		where('created_at between ? and ?', DateTime.now - 3.days, Time.now)
	}

	#scopes can chain. returns all other if nil
	scope :no_picture, -> {
		where("profile_picture IS ? OR profile_picture IS ?", nil, '')
	}

	#class methods cannot
	def self.check_login(email, password)
		user = find_by(email: email)
		return user if user && user.password == password
	end
end