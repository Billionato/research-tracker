class Subtopic < ActiveRecord::Base
    
    belongs_to :topic
    has_many :items
    
end
