require 'rails_helper'

RSpec.describe "invitations/new", type: :view do
  before(:each) do
    assign(:invitation, Invitation.new(
      company: nil,
      user: nil,
      status: "MyString"
    ))
  end

  it "renders new invitation form" do
    render

    assert_select "form[action=?][method=?]", invitations_path, "post" do

      assert_select "input[name=?]", "invitation[company_id]"

      assert_select "input[name=?]", "invitation[user_id]"

      assert_select "input[name=?]", "invitation[status]"
    end
  end
end
