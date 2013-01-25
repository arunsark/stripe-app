class Subscription < ActiveRecord::Base
  attr_accessor :stripe_card_token
  attr_accessible :email, :plan_id, :stripe_customer_token, :stripe_card_token
  belongs_to :plan

  validates :plan_id, :presence => true
  validates :email, :presence => true

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    else
      false
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
