class Datapoint < ActiveRecord::Base
  belongs_to :company
  belongs_to :article
end
