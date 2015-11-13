require 'rails_helper'

RSpec.describe QuestionsController do

  before(:each) do
    @question = FactoryGirl.create(:question)
  end
  describe "GET index" do
    it "assigns @questions" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end

  end
end
