class EsewaPaymentsController < ApplicationController
  def index
  end

  def success
  	@esewa_payment = EsewaPayment.new
  	@esewa_payment.product_id = params['oid']
  	@esewa_payment.reference_id = params['refId']
  	@esewa_payment.amount = params['amt']
  	@esewa_payment.save!
  end

  def failure
  end
end
