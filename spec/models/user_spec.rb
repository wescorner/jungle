require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves successfully with all fields' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end
    it 'does not save without first_name field' do
      @user = User.create(last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'does not save without last_name field' do
      @user = User.create(first_name: "Wesley", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'does not save without email field' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'does not save without password field' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'does not save without password_confirmation field' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "EMAIL@gmail.com", password: "password")
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'does not save when email is non-unique' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'does not save when password != password_confirmation' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password2")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'does not save when password is below 6 characters' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "pass", password_confirmation: "pass")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should return the user when the password is correct' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("email@gmail.com", "password")).equal?(@user)
    end
    it 'should return nil when the password is incorrect' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("email@gmail.com", "incorrectpassword")).to be_nil
    end
    it 'should return the user when the password is correct but email has whitespace' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("  email@gmail.com  ", "password")).equal?(@user)
    end
    it 'should return the user when the password is correct but email is wrong case' do
      @user = User.create(first_name: "Wesley", last_name: "Corner", email: "email@gmail.com", password: "password", password_confirmation: "password")
      expect(User.authenticate_with_credentials("EMAIL@gmail.com", "incorrectpassword")).equal?(@user)
    end
  end
end
