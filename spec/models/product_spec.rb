require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {Product.new( code: "GR1", name:"Green", price:"3.11")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a code" do
    subject.code = nil
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.code = nil
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.code = nil
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    expect(subject).to_not be_valid
  end

end
