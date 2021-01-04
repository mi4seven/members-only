class Post < ApplicationRecord
  validates :title, :body, presence: true
  #validates :title, uniqueness: {scope: :title, message: "A Post with that Title already exists."}  
  validates :title, uniqueness: {message: "A Post with that Title already exists."}    

  belongs_to :user
end
