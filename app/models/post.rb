class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments
	acts_as_votable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :title, presence: true
end
