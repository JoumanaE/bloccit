require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :view do
  <h1> All Posts </h1>
  <% @pots.each do |post| %>
    <p><%= link_to post.title, post_path(post.id) %></p>
    <% end %>
end
