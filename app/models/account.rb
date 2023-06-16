class Account < ApplicationRecord
  include Rodauth::Rails.model

  has_one :profile
  enum :status, unverified: 1, verified: 2, closed: 3

  def to_builder
    Jbuilder.new do |account|
      account.call(self, :status, :email)
      account.profile profile.to_builder
    end
  end
end
