require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      title: "MyString",
      description: "MyString",
      score: 1
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[title]"

      assert_select "input[name=?]", "review[description]"

      assert_select "input[name=?]", "review[score]"
    end
  end
end
