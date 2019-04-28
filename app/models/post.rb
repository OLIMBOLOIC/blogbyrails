class Post < ApplicationRecord
    has_many  :commentaires, dependent: :destroy
    validates :titre, presence: true, length: {minimum: 5}
    validates :contenu, presence: true
    belongs_to :utilisateur
    extend FriendlyId
    friendly_id :titre, use: :slugged
end
