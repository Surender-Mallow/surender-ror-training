require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:company) do
    create(:company)
  end

  let(:job) do
    create(
      :job,
      company: company)
  end

  describe "validations" do
    it "validates presence of title" do
      job.title = nil
      expect(job).not_to be_valid
      expect(job.errors[:title]).to include("can't be blank")
    end

    it "validates presence of description" do
      job.description = nil
      expect(job).not_to be_valid
      expect(job.errors[:description]).to include("can't be blank")
    end

    it "validates presence of salary" do
      job.salary = nil
      expect(job).not_to be_valid
      expect(job.errors[:salary]).to include("can't be blank")
    end

    it "validates salary value" do
      job.salary = 0
      expect(job).not_to be_valid
      expect(job.errors[:salary]).to include("must be greater than 0")
    end

    it "validates company association" do
      job.company = nil
      expect(job).not_to be_valid
      expect(job.errors[:company]).to include("must exist")
    end
  end
end
