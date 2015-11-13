require 'rails_helper'

RSpec.describe Question, type: :model do
  context "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :content}
    it { should validate_presence_of :author}
  end

  context "#question" do
    let(:question) {FactoryGirl.build :question}
  end
end
