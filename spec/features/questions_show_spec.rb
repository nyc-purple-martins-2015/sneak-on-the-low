require 'rails_helper'

feature 'Index Page' do

  let!(:questions) {Array.new(4) {FactoryGirl.create(:question)}}

  context "the root page (questions#index)" do
    it "has a questions title" do
      visit questions_path
      expect(page).to have_content("Questions")
    end

    it "has a list of links for each question" do
      visit questions_path
      questions.each do |q|
        find_link(q.title)
      end
    end

    it "has clickable links that take you to the question#show path" do
      visit questions_path
      save_and_open_page
      questions.each do |q|
        click_link(q.title)
        expect(page.current_path).to eq question_path(q)
        visit questions_path
      end
    end

  end



end
