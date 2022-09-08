class LoanPaymentSchedule
  def  initialize(att = {})
    @loan = att[:loan]
  end
  def call
    # build payment schedule
    payment_schedule

    create_payments
  end
  def payment_schedule
    @payback_time = @loan.payback_time
    @payment_frequency = @loan.payment_frequency
    if @payment_frequency == "Quarterly"
      @payment_gap = 91
    else
      @payment_gap = 30
    end
  end
  def create_payments()
    number_of_payments = (@payback_time / @payment_gap).ceil
    payment_amount = (@loan.amount / number_of_payments).round(2)
    date = Date.today
    num = 0
    while num < number_of_payments
      due_date = date.next_day(@payment_gap)
      payment_status = "Scheduled"
      LoanPayment.create(loan: @loan, amount: payment_amount, due_date: due_date, payment_status: payment_status)
      date = due_date
      num += 1
    end
  end
end
