class Transfer < ApplicationRecord
  belongs_to :loan
  belongs_to :wallet
end
