require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:cart) }
  end
end
