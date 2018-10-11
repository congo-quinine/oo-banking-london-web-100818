require_relative '../lib/bank_account'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
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
    self.status = 'complete'
    elsif @sender.valid? == false
    self.status = "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer 
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount 
      @status = 'reversed'
    end
    
  end
  
end
