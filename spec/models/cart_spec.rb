require 'rails_helper'

RSpec.describe Cart, type: :model do
  subject { FactoryBot.build(:cart) }
  let(:product) { FactoryBot.create(:product) }  
  let(:log) { FactoryBot.create(:log) } 
  let(:cart) { FactoryBot.create(:cart, is_validate: false) } 
  let(:cart_item) {FactoryBot.create(:cart_item, product_id: product.id, cart_id: cart.id, log_id: log.id )}
  let(:cart_item2) {FactoryBot.create(:cart_item, product_id: product.id, cart_id: cart.id, log_id: log.id )}
  # describe 'validation' do
  #   it { is_expected.to validate_presence_of(:is_validate) }
  # end

  describe "Associations" do
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:products) }
    it { is_expected.to have_one(:order) }
  end

  describe "Creating cart" do
    context "with cart_item is empty" do
      it "is return cart empty " do
        # raise cart.cart_items.inspect
        expect(cart.cart_items).to be_empty 
      end
    end

    context "with sub_total of cart" do
      it "is exact sub_total without cart_items" do
        expect(cart.sub_total).to eq(0) 
      end

      it "is exact sub_total with same cart_items" do
        cart.cart_items << cart_item
        cart.cart_items << cart_item2
        sum = 0
        cart.cart_items.each do |item|
          sum+= item.total_price
        end
        expect(sum).to eq(cart.sub_total)
      end
    end   
    
  end

  describe "quantity of cart_items in cart" do
    context "correct quantity" do
      it "is exact quantity in cart" do
        cart.cart_items << cart_item
        cart.cart_items << cart_item2
        expect(cart.cart_items.count).to eq(2)
      end

      it "is exact quantity of product in cart" do
        cart.cart_items << cart_item
        cart.cart_items << cart_item2
        cart.cart_items[0].quantity += 1
        
        expect(cart.cart_items.count).to eq(2)
        expect(cart.cart_items[0].quantity).to eq(2)
        expect(cart.cart_items[1].quantity).to eq(1)
      end
    end
    context "incorrect quantity" do
      it "is not exact quantity in cart" do
        cart.cart_items << cart_item
        cart.cart_items << cart_item2
        expect(cart.cart_items.count).to_not eq(3)
      end
    end
  end
  

  
end
