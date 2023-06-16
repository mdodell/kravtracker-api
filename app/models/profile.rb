class Profile < ApplicationRecord
  belongs_to :account

  def to_builder
    Jbuilder.new do |profile|
      profile.call(self, :first_name, :last_name)
    end
  end
end
