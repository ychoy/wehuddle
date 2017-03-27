require 'spec_helper'

RSpec.describe ChatroomsController, :type => :controller do

  describe "GET #new" do
      it "renders the new chatrooms page" do
        # this line simulates a "GET" request to the chatrooms controller
        # that hits the #new method, passing in `{chatroom: {}}` as params.
        get :new, chatroom: {}
        # check to make sure that the response renders back the new template
        expect(response).to render_template("new")
        expect(response).to have_http_status(200)
      end
    end


  describe "POST #create" do

    context "with invalid params" do
      it "validates the presence of title and body" do
        post :create, chatroom: {title: "this is an invalid chatroom", description: "cats!"}
        #BUG - doesn't recognize chatroom id
        post :create, membership: {user_id => current_user.id, chatroom_id => @chatroom_id}

        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the chatroom show page" do
        post :create, chatroom: {title: "teehee", description: "cats!"}
        #BUG - doesn't recognize chatroom id
        post :create, membership: {user_id => current_user.id, chatroom_id => @chatroom_id}

        expect(response).to redirect_to(chatroom_path(chatroom.last))
      end
    end
  end

end
