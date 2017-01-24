class Article < ActiveRecord::Base

  belongs_to :company
  has_many :datapoints
end
