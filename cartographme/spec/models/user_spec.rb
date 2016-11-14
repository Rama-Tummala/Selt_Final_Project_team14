require 'spec_helper'
require 'rails_helper'

RSpec.describe User do

 subject { described_class.new(name: "rama",email: "rama@abc.com", password: "123456", password_confirmation: "123456") }

  it "should create a new instance of a user given valid attributes" do
    User.create!(name: "rama",email: "rama@abc.com", password: "123456", password_confirmation: "123456")
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
  
   it "is not valid without a match between password and password_confirmation" do
      subject.password = 'tummala'
      subject.password_confirmation = 'tummala'
      expect(subject).to be_valid
    end
    
   it "is not valid if password length is short" do
      subject.password = '123'
      expect(subject).to_not be_valid
    end
    
 it "is not valid without a match between password and password_confirmation" do
      subject.password = 'tummala'
      subject.password_confirmation = 'tummalar'
      expect(subject).to_not be_valid
    end
  
end

