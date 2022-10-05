require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        title: "Title",
        description: "Description",
        score: 2
      ),
      Review.create!(
        title: "Title",
        description: "Description",
        score: 2
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
