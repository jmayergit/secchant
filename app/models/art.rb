class Art < ActiveRecord::Base
  belongs_to :admin
  has_many :comments, dependent: :destroy
end
