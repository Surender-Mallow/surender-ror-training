require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) do
    create(:company)
  end

  describe "validations" do
    it "validates presence of name" do
      company.name = nil
      expect(company).not_to be_valid
      expect(company.errors[:name]).to include("can't be blank")
    end

    it "validates presence of description" do
      company.description = nil
      expect(company).not_to be_valid
      expect(company.errors[:description]).to include("can't be blank")
    end
  end
end
