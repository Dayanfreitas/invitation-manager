require 'rails_helper'

RSpec.describe "invitations/show", type: :view do
  before(:each) do
    assign(:invitation, Invitation.create!(
      company: nil,
      user: nil,
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Status/)
  end
end
