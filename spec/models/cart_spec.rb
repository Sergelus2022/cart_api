require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "validations" do
    it { should validate_presence_of(:api_key) }
  end

  describe "associations" do
    it { should have_many(:sellitems).dependent(:destroy) }
  end
end
