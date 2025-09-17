require 'rails_helper'

RSpec.describe User, type: :model do
  let(:company) do
    create(:company)
  end

  let(:user) do
    create(:user)
  end

  describe "validations" do
    it "validates presence of first name" do
      user.first_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "validates presence of last name" do
      user.last_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "validates presence of type" do
      user.type = nil
      expect(user).not_to be_valid
      expect(user.errors[:type]).to include("can't be blank")
    end

    it "validates presence of email" do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end
