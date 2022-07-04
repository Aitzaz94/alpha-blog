class Article < ApplicationRecord
    
    validates :title, presence: true, length: {minimum:5, maximum:60}
    validates :description, presence: true, length: {minimum:25, maximum:250}

end