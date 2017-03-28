require 'rails_helper'

RSpec.feature "AddNewChatrooms", type: :feature do
  # it "should require the user log in before adding a post" do
  #   first_name = "Cat"
  #   last_name = "Jain"
  #   username = "kittehsrock"
  #   email = "kittehs@rock.com"
  #   password = "123456789"
  #   u = create( :user, first_name: first_name, last_name: last_name,
  #   username: username, email: email, password: password, password_confirmation: password )
  #
  #   visit new_chatroom_path
  #
  #   #show login form and fill it out
  #   within "#new_user" do
  #     fill_in "first_name", with: u.first_name
  #     fill_in "last_name", with: u.last_name
  #     fill_in "username", with: u.username
  #     fill_in "email", with: u.email
  #     fill_in "user_password", with: password
  #   end
  #
  #   click_button "Log in"
  #
  #   #fill out the new chatroom form
  #   within "#new_chatroom" do
  #     fill_in "chatroom_title", with: "Chatroom title"
  #     fill_in "chatroom_description", with: "About the Chatroom"
  #   end
  #
  #   click_link_or_button "Add Chatroom"
  #
  #   #make sure new chatroom is in the DB
  #   expect( Chatroom.count ).to eq(1)
  #   expect( Chatroom.first.title).to eq( "Chatroom title")
  #   expect( Chatroom.first.description).to eq( "About the Chatroom")
  # end

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
