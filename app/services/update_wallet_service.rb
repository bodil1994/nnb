class UpdateWalletService
  def initialize(att = {})
    @lender_transaction = att[:lender_transaction]
    @borrower_transaction = att[:borrower_transaction]
    @borrower_wallet = att[:borrower_wallet]
    @lender_wallet = att[:lender_wallet]
    @transaction_type = att[:transaction_type]
  end

  def call()
    # TRANSACTION INSIDE THE APP = transaction_type == "Transfer" and @loan.instant_loan? = auto
    if @transaction_type == "Transfer"
      if @borrower_transaction.transfer_type && @borrower_transaction.transfer_type == "Deposit"
        loan_request
      else
        loan_payback
      end
      # TRANSACTION OUTSIDE THE APP = status = "APPROVED"
      # There is no transaction_type, we look into the deposit table. Just need to see if it is approved
    elsif @borrower_transaction.class.name == "Deposit" && @borrower_transaction.status == "Approved"
      @borrower_wallet.amount += @borrower_transaction.amount
      # TRANSACTION OUTSIDE THE APP = transaction_type == "Withdrawal" and status = "APPROVED"
      # There is no transaction_type, we look into the withdrawal table. Just need to see if it is approved
    elsif @borrower_transaction.class.name == "WithdrawalRequest" && @borrower_transaction.status == "Approved"
      @borrower_wallet.amount -= @borrower_transaction.amount
    end
    @borrower_wallet.save
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
