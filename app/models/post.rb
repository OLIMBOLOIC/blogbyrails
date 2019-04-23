class Post < ApplicationRecord
    validates :titre, presence: true, length: {minimum: 5}
    validates :contenu, presence: true
end
