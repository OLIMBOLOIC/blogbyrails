class Post < ApplicationRecord
    has_many  :commentaires, dependent: :destroy
    validates :titre, presence: true, length: {minimum: 5}
    validates :contenu, presence: true
end
