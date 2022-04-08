require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:log) { FactoryBot.create(:log) } 

  describe 'validation' do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:cart_items) }
  end

  describe "when creating log" do

    context " with attributes" do
      it "is valid with valid attributes" do
        expect(log).to be_valid
      end
    end

    context " without attributes" do
      it "is invalid without description" do
        log.description= nil
        expect(log).to_not be_valid
      end
    end
  end
  
end
