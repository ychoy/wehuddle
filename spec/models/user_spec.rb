require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.new(
                first_name: "will",
                last_name: "Kaspar",
                email:  "w@k.com",
                username: "ausername",
                biography: "here there be dragons"
              )
 end

  context "...has..." do
    it "a valid first name" do
      expect(@user.first_name.length).to be < 50
    end
    it "a valid last name" do
      expect(@user.last_name.length).to be < 50
    end
    it "a valid username" do
      expect(@user.username).not_to be_empty
      expect(@user.last_name.length).to be_between(1, 15)
    end
    it "a valid email" do
      expect(@user.email).not_to be_empty
      expect(@user.email).to include('@')
    end
    it "a valid biography" do
      expect(@user.biography.length).to be < 1000
    end
  end
end
