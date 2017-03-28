require 'rails_helper'

RSpec.feature "AddNewChatrooms", type: :feature do
  it "should create a new chatroom with a logged in user" do
    login_as create( :user ), scope: :user

    visit new_chatroom_path

    within "#new_chatroom" do
      fill_in "chatroom_title", with: "Chatroom title"
      fill_in "chatroom_description", with: "About the Chatroom"
    end

    click_link_or_button "Create"

    expect( Chatroom.count ).to eq(1)
    expect( Chatroom.first.title).to eq( "Chatroom title")
    expect( Chatroom.first.description).to eq( "About the Chatroom")
  end
end
