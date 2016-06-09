require 'rails_helper'

RSpec.describe "materials/show", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Link/)
  end
end
