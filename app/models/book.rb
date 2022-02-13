class Book < ApplicationRecord
  belongs_to:user
  has_many:favorites,dependent: :destroy
  attachment:image
  has_many:comments,dependent: :destroy
  
  def favorite_by(user)
    favorites.where(user_id:user.id).exists?
  end
end
