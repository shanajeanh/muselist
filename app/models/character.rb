class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :canon

  validates :name, presence: true
  validates :journal_url, presence: true
end
