require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:topic) {Topic.create!(name: "a topic name", description: "something here with stuff")}
  let(:sponsored_post) { SponsoredPost.create!(title: "Some title here", body: "and something here too", price: 100, topic: topic)}

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: sponsored_post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id, id: sponsored_post.id
      expect(response).to have_http_status(:success)
    end
  end

end
