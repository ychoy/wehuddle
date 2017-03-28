require 'rails_helper'

RSpec.feature "EditChatrooms", type: :feature do
  it "should edit chatroom with a logged in admin" do
    user = create( :user)
    login_as user, scope: :user

    @chatroom = Chatroom.create(title: "foo", description: "bar")
    total = Chatroom.all.count
    @chatroom.admin = user.id
    visit edit_chatroom_path(@chatroom)

    within "#edit_chatroom_#{@chatroom.id}" do
      fill_in "chatroom_title", with: "Updated chatroom title"
      fill_in "chatroom_description", with: "Updated chatroom description"
    end

    click_link_or_button "Update"

    expect( Chatroom.count ).to eq (total.to_i)
    expect( Chatroom.first.title).to eq( "Updated chatroom title")
    expect( Chatroom.first.description).to eq( "Updated chatroom description")
  end
end
