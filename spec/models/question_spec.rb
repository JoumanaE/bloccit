require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:Question) {Question.create!(title:"New Question", body: "New Question Body") }

  describe "attributes" do
    it "should respond to question" do
      expect(question). to respond_to(:title)
    end

    it "should respond to body" do
      expect(post).to respond_to(:body)
    end
  end
end
