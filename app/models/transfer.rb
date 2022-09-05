class Transfer < ApplicationRecord
  belongs_to :loan, optional: true
  belongs_to :wallet
end
