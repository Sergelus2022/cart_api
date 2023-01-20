require 'rails_helper'

RSpec.describe Sellitem, type: :model do
 
  describe "associations" do
    it { is_expected.to belong_to(:cart) }
    
  end
end
