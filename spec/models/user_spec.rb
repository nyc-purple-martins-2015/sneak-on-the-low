require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :username }
    it { should allow_value('tahrim').for(:username)}
    it { should validate_presence_of :email }
    it { should allow_value('test@test.com').for(:email) }
    it { should_not allow_value('badlyFormattedEmail').for(:email) }
  end

end
