require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(
    first_name: 'John',
    last_name: 'Snow',
    email: 'example@example.com',
    password: '123456',
    password_confirmation: '123456'
  ) }

  describe 'Validations' do
    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without matching password and confirmation' do
      subject.password = '456'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "is not valid if password length less than 3 characters" do
      subject.password = "12"
      subject.password_confirmation = "12"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns the user if user exists' do
      subject.save
      @user = User.authenticate_with_credentials('user@test.com','123')
      expect(@user).to_not be_nil
    end

    it "returns nil if user doesn't exist" do
      subject.save
      @user = User.authenticate_with_credentials('example@example.com','password')
      expect(@user).to be_nil
    end

    it "returns the user even if there are trailing or leading spaces" do
      subject.save
      @user = User.authenticate_with_credentials('   user@test.com   ','123')
      expect(@user).to_not be_nil
    end

    it "returns the user with wrong case" do
      subject.save
      @user = User.authenticate_with_credentials('uSer@tesT.Com','123')
      expect(@user).to_not be_nil
    end
  end
end
