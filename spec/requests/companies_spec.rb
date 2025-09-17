require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let(:valid_attributes) do
    { name: 'Testing', description: "Testing" }
  end

  let(:invalid_attributes) do
    { name: nil, description: nil }
  end

  describe "GET /index" do
    it "returns http success" do
      get companies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get company_url(company)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_company_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      company = Company.create! valid_attributes
      get edit_company_url(company)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url, params: { company: valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created Company" do
        post companies_url, params: { company: valid_attributes }
        expect(response).to redirect_to(company_url(Company.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url, params: { company: invalid_attributes }
        }.to change(Company, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post companies_url, params: { company: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'updated', description: "Testing DESC" }
      }

      it "updates the requested company" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(company.name).to eq(new_attributes[:name])
        expect(company.description).to eq(new_attributes[:description])
      end

      it "redirects to the company" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(response).to redirect_to(company_url(company))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        company = Company.create! valid_attributes
        patch company_url(company), params: { company: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete company_url(company)
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the posts list" do
      company = Company.create! valid_attributes
      delete company_url(company)
      expect(response).to redirect_to(companies_url)
    end
  end
end
