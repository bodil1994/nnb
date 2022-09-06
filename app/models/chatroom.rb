class Chatroom < ApplicationRecord
  belongs_to :loan
  has_many :messages
end
