require 'rails_helper'

RSpec.describe "materials/index", type: :view do
  before(:each) do
    assign(:materials, [
      Material.create!(
        :link => "Link"
      ),
      Material.create!(
        :link => "Link"
      )
    ])
  end

  it "renders a list of materials" do
    render
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
