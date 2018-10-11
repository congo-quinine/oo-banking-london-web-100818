require_relative '../lib/bank_account'

class Transfer
  
  attr_reader :sender, :receiver, :status, :amount
  @@history = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    if @sender.valid? == true
    @sender.balance -= @amount 
    @receiver.balance += @amount
    @status = 'complete'
    elsif @sender.valid? == false
    @status = "Transaction rejected. Please check your account balance."
    end
  end
  
end
