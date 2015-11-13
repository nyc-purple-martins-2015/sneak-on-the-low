require 'rails_helper'

feature 'Admin panel' do

  context "on root page (questions#index)" do
    it "can see a list of all questions that have been asked" do
      visit questions_path
      expect(page.body).to have_content("Questions")
    end
  end

end
