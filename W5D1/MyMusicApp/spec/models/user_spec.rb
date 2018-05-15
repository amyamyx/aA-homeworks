require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create(
      email: "jonathan@fakesite.com",
      password: "good_password")
  end

  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6)}
  end

  # describe "session_token" do
  #   it "should gene" do
  #
  #   end
  # end

  describe "#password=" do
    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with('abcdefg')
      User.create( email: '123456@123', password: 'abcdefg')
    end
  end

  describe "#is_password?" do
    it "decrypts the password_digest via BCrypt" do
      expect(BCrypt::Password).to receive(:new).with(user.password_digest)
    end
  end

  describe "#reset_session_token" do
    it "assigns a session_token if no one is given"
    it "should save the session_token to the database"
    it "returns the session_token"
  end

  describe "::find_by_credentials" do
  end

end
