class UpdateWalletService
  def initialize(att = {})
    @lender_transaction = att[:lender_transaction]
    @borrower_transaction = att[:borrower_transaction]
    @borrower_wallet = att[:borrower_wallet]
    @lender_wallet = att[:lender_wallet]
    @transaction_type = att[:transaction_type]
  end

  def call()
    if @transaction_type == "Transfer"
      if @borrower_transaction.transfer_type && @borrower_transaction.transfer_type == "Deposit"
        loan_request
      else
        loan_payback
      end
    # elsif @transaction_type == ""
    end
  end

  def loan_request
    borrower_top_up = @borrower_wallet.amount + @borrower_transaction.amount
    @borrower_wallet.update!(amount: borrower_top_up)
    lender_top_down = @lender_wallet.amount - @lender_transaction.amount
    @lender_wallet.update!(amount: lender_top_down)
  end

  def loan_payback
    lender_top_up = @lender_wallet.amount + @lender_transaction.amount
    @lender_wallet.update!(amount: lender_top_up)
    borrower_top_down = @borrower_wallet.amount - @borrower_transaction.amount
    @borrower_wallet.update!(amount: borrower_top_down)
  end
end
