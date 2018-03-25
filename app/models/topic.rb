class Topic < ActiveRecord::Base
    
    has_many :subtopics, dependent: :destroy
    has_many :items, through: :subtopics
    
end
