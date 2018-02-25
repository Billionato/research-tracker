class Topic < ActiveRecord::Base
    
    has_many :subtopics, dependent: :destroy
    
end
