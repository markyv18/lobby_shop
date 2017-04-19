class ScumbagReview < ActiveRecord::Base
belongs_to :review
belongs_to :scumbag
end
