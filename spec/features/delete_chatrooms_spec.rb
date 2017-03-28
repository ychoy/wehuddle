require 'rails_helper'

RSpec.feature "DeleteChatrooms", type: :feature do
  it "should remove chatroom" do
    user = create( :user)
    login_as user, scope: :user

    @chatroom = Chatroom.create(title: "foo", description: "bar")
    total = Chatroom.all.count

    @chatroom.admin = user.id
    visit edit_chatroom_path(@chatroom)

    click_link_or_button "Delete"

    expect( Chatroom.count ).to eq((total-1).to_i)
    end
end
