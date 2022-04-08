require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:product) { FactoryBot.create(:product) }  
  let(:log) { FactoryBot.create(:log) } 
  let(:cart) { FactoryBot.create(:cart, is_validate: false) } 
  let(:cart_item) {FactoryBot.create(:cart_item, product_id: product.id, cart_id: cart.id, log_id: log.id )}
  
  describe "Associations" do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:cart) }
    it { is_expected.to belong_to(:log) }
  end

  describe "creating cart_item " do
    context "with attributes" do
      it "is valid with valid attributes" do
        expect(cart_item).to be_valid
      end
    end

    context "without same attributes" do
      it "is invalid without cart_id" do
        cart_item.cart_id = nil
        expect(cart_item).to_not be_valid
      end
      it "is invalid without product_id" do
        cart_item.product_id = nil
        expect(cart_item).to_not be_valid
      end
      it "is invalid without log_id" do
        cart_item.log_id = nil
        expect(cart_item).to_not be_valid
      end
    end
    
  end

  describe "quantity" do
    context "when adding 1" do
      it "is increment" do
        cart_item.quantity +=1
        expect(cart_item.quantity).to eq(2)
      end
      
    end

    context "when reducing 1" do
      it "is decrement" do
        cart_item.quantity = 2
        if cart_item.quantity > 1
          cart_item.quantity -=1
          expect(cart_item.quantity).to eq(1)
        end
      end

      it "is not decrement" do
        cart_item.quantity = 1
        if cart_item.quantity == 1
          cart_item.quantity -= 0
          expect(cart_item.quantity).to eq(1)
        end
      end
      
    end
  end

  describe "deleting cart_item" do
    context "with good attributes" do
      it "is successfully" do
        cart_item.destroy
        expect(CartItem.find_by(id: cart_item.id)).to be_nil
      end
      
    end
    
  end
  
  

end
