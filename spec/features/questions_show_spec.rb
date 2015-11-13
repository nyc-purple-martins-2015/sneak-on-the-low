require 'rails_helper'

feature 'Index Page' do

  let!(:questions) {FactoryGirl.create(:question)}

  context "the root page (questions#index)" do
    it "has a questions title" do
      visit questions_path
      expect(page).to have_content("Questions")
    end

    it "has a list of links for each question" do
      visit questions_path

      expect(page).to have_content("Questions")
    end
  end



end
