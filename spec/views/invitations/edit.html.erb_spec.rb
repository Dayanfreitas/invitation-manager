require 'rails_helper'

RSpec.describe "invitations/edit", type: :view do
  let(:invitation) {
    Invitation.create!(
      company: nil,
      user: nil,
      status: "MyString"
    )
  }

  before(:each) do
    assign(:invitation, invitation)
  end

  it "renders the edit invitation form" do
    render

    assert_select "form[action=?][method=?]", invitation_path(invitation), "post" do

      assert_select "input[name=?]", "invitation[company_id]"

      assert_select "input[name=?]", "invitation[user_id]"

      assert_select "input[name=?]", "invitation[status]"
    end
  end
end
