class Book < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true, length: { minimum: 5 }
	validates :author, presence: true, length: { minimum: 5 }

	scope :available, -> { where(user_id: nil) }
	# scope :reserved, ->(user_id) { where(user_id: user_id) }

	has_attached_file :cover,
		:styles => {
			:medium => "100x200>", 
			:thumb => "50x100#"
		},
		:default_url => "/images/:style/missing.png"
	validates_attachment :cover, :content_type => { :content_type => ["image/jpeg", "image/jpg"] }
end
