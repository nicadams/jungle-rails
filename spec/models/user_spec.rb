require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "passwords match do not match" do
      @user = User.create(
        email: "test@test.com",
        first_name: "John",
        last_name: "Smith",
        password: "Lighthouse2015",
        password_confirmation: "Lighthouse2016"
        )
      expect(@user.errors.full_messages).to include "The passwords don't match"
    end

    it "Email cannot be nil" do
      @user = User.create(
        email: nil,
        first_name: "John",
        last_name: "Smith",
        password: "Lighthouse2016",
        password_confirmation: "Lighthouse2016"
        )
      expect(@user.errors.full_messages).to include "The e-mail can't be blank"
    end

    it "User creation fields are filled appropriately" do
      @user = User.create!(
        email: "test@test.com",
        first_name: "John",
        last_name: "Smith",
        password: "Lighthouse2016",
        password_confirmation: "Lighthouse2016"
        )
      expect(@user.email).to be_present
      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end

  end
end
