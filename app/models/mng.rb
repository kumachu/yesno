class Mng < ActiveRecord::Base
  validates :question, presence: true
end
