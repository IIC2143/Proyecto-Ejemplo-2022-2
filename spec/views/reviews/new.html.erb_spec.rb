require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      title: "MyString",
      description: "MyString",
      score: 1
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[title]"

      assert_select "input[name=?]", "review[description]"

      assert_select "input[name=?]", "review[score]"
    end
  end
end
