require 'rails_helper'

feature 'Index Page' do

  let!(:questions) {Array.new(4) {FactoryGirl.create(:question)}}.uniq

  context "the root page (questions#index)" do

    it "has a questions title" do
      visit questions_path
      expect(page).to have_content("Questions")
    end

    it "has a list of questions that are each a link" do
      visit questions_path
      questions.each do |q|
        find_link(q.title)
      end
    end

    it "each of these links take you to the question#show path for that question" do
      visit questions_path
      save_and_open_page
      questions.each do |q|
        click_link(q.title)
        expect(page.current_path).to eq question_path(q)
        visit questions_path
      end
    end

    # it "each question shows you it's number of votes" do
    #   visit questions_path
    #   questions.each do |q|
    #     within(:css, "span#Votes#{q.id}") do
    #       find("Votes: #{q.votes.sum(:value)}").text
    #     end
    #   end
    # end

    # it "each question shows you the number of answers" do
    #   visit questions_path
    #   questions.each do |q|
    #     within(:css, "span#Answers#{q.id}") do
    #       find("Answers: #{q.answers.count}").text
    #     end
    #   end
    # end

    # it "each question has tags" do
    #   visit questions_path
    #   questions.each do |q|
    #     find_link(q.tags)
    #   end
    # end


  end
end
