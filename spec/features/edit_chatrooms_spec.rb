require 'rails_helper'

RSpec.feature "EditChatrooms", type: :feature do
  it "should edit chatroom with a logged in admin" do
    login_as create( :user ), scope: :user

    visit edit_chatroom_path #BUG - not reading the chatroom_id

    within "#edit_chatroom" do
      fill_in "chatroom_title", with: "Updated chatroom title"
      fill_in "chatroom_description", with: "Updated chatroom description"
    end

    click_link_or_button "Update"

    expect( Chatroom.count ).to eq(1)
    expect( Chatroom.first.title).to eq( "Updated chatroom title")
    expect( Chatroom.first.description).to eq( "Updated chatroom description")
  end
end
