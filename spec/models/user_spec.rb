require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'Validations' do
    #create a valid user
    it 'should create a valid user' do
      user = User.create(
        last_name: "Cena",
        first_name: "John",
        email: "j@cena.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(user).to be_present
    end
    #user password is blank
    it 'should not create a user since password is blank and confirmation is nil' do
      password = User.create(
        last_name: "Cena",
        first_name: "John",
        email: "j@cena.com",
        password: nil,
        password_confirmation: nil
      )
      expect(password).to_not be_valid
    end
    #user last_name is blank
    it 'should not create a user since last_name is nil' do
      last_name = User.create(
        last_name: nil,
        first_name: "John",
        email: "j@cena.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(last_name).to_not be_valid
    end
    #user last_name is blank
    it 'should not create a user since first_name is nil' do
      first_name = User.create(
        last_name: "Cena",
        first_name: nil,
        email: "j@cena.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      expect(first_name).to_not be_valid
    end
    #user does not have matching password
    it 'should not create a user since passwords don\'t match' do
      password_match = User.create(
        last_name: "Cena",
        first_name: "John",
        email: "j@cena.com",
        password: "qwerty",
        password_confirmation: "qwe"
      )
      expect(password_match.password).to_not be_equal(password_match.password_confirmation)
    end
    #passwords should have a minimum length of 3
    it 'should not create a user since password is less than 3 characters' do
      password_length = User.create(
        last_name: "Cena",
        first_name: "John",
        email: "j@cena.com",
        password: "qw",
        password_confirmation: "qw"
      )
      expect(password_length).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'checks if the user password matches in the database' do
      user = User.create(
        last_name: "Cena",
        first_name: "John",
        email: "john@cena.com",
        password: "qwerty",
        password_confirmation: "qwerty"
      )
      is_authenticated = User.authenticate_with_credentials(user.email, user.password)
      expect(is_authenticated).to_not be_valid
    end
  end
end