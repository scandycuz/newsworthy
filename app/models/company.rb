class Company < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  has_many :articles
  has_many :datapoints
end
