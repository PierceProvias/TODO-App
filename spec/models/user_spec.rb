# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  
let(:valid_user) {User.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password_digest: 'password')}
  context 'validations' do
    it 'is valid with valid attributes' do
    expect(valid_user).to be_valid
    end
    
    it 'is not valid without a first_name' do
      valid_user.first_name = nil
      expect(valid_user).not_to be_valid
      expect(valid_user.errors[:first_name]).to include("can't be blank")
    end

    it 'is not valid without a last_name' do
      valid_user.last_name = nil
      expect(valid_user).not_to be_valid
      expect(valid_user.errors[:last_name]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      valid_user.email = nil
      expect(valid_user).not_to be_valid
      expect(valid_user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an invalid email format' do
      valid_user.email = 'invalid_email'
      expect(valid_user).not_to be_valid
      expect(valid_user.errors[:email]).to include("Must be a valid email address")
    end

    context 'secure password' do
      it 'has a secure password' do
        expect(valid_user).to respond_to(:password_digest)
        expect(valid_user).to respond_to(:password)
        expect(valid_user).to respond_to(:authenticate)
      end

      it 'does not save passwords to the database' do
        valid_user.password = 'password'
        valid_user.save
        expect(User.find(valid_user.id).password).to be_nil
      end

      it 'authenticates with correct password' do
        valid_user.password = 'password'
        valid_user.save
        expect(valid_user.authenticate('password')).to be_truthy
      end

      it 'does not authenticate with incorrect password' do
        valid_user.password = 'password'
        valid_user.save
        expect(valid_user.authenticate('wrong_password')).to be_falsey
      end
    end
  end
    
end