require 'rails_helper'

RSpec.describe User, type: :model do
  
  fixtures :all
  

  it 'is not valid without a first name, last name, email or password' do
    subject.first_name = nil
    subject.last_name = nil
    subject.email = nil
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end

  
  it "has first name, last name, email, and password" do
    user = users(:pierce)
    expect(user.first_name).to eql "Pierce"
    expect(user.last_name).to eql "Provias"
    expect(user.email).to eql "p.provias@outlook.com"
    expect(user.password_digest).to eql "12345"
  end
  

end
