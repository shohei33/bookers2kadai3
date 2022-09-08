class Book <
  belongs_to :user_params

  validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

end
