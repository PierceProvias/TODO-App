# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  
let(:user) {User.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password_digest: 'password')}
  
  context 'validations' do
    it 'is valid with valid attributes' do
    expect(user).to be_valid
    end 
    
    it 'is not valid without a first_name' do
      user.first_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'is not valid without a last_name' do
      user.last_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an invalid email format' do
      user.email = 'invalid_email'
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("Must be a valid email address")
    end

    context 'secure password' do
      it 'has a secure password' do
        expect(user).to respond_to(:password_digest)
        expect(user).to respond_to(:password)
        expect(user).to respond_to(:authenticate)
      end

      it 'does not save passwords to the database' do
        user.password = 'password'
        user.save
        expect(User.find(user.id).password).to be_nil
      end

      it 'authenticates with correct password' do
        user.password = 'password'
        user.save
        expect(user.authenticate('password')).to be_truthy
      end

      it 'does not authenticate with incorrect password' do
        user.password = 'password'
        user.save
        expect(user.authenticate('wrong_password')).to be_falsey
      end
    end
  end
    
end