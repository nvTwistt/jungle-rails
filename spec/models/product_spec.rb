require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid weapon' do
      category = Category.create(name:"Weapons")
      product = Product.create(
        name: "Nunchucks",
        price: 500.00,
        quantity: 1,
        category_id: category.id
        )
      expect(product).to be_present
    end

    it 'shouldn\'t save an invalid name' do
      category = Category.create(name: "Toys")
      name = Product.create(
        name: nil,
        price: 3000.00,
        quantity: 12,
        category: category
        )
      expect(name.errors.full_messages).to include "Name can't be blank"
    end

    it 'shouldn\'t save with an invalid category' do
      category = Category.create(name: "Weapons")
      pcategory = Product.create(
        name: "hand",
        price: 100.00,
        quantity: 11,
        category: nil
        )
      expect(pcategory.errors.full_messages).to include "Category can't be blank"
    end

    it 'shouldn\'t save with an invalid quantity' do
      category = Category.create(name: "Weapons")
      quantity = Product.create(
        name: "Hand",
        price: 19.00,
        quantity: nil,
        category: category
        )
      expect(quantity.errors.full_messages).to include "Quantity can't be blank"
    end
    
    it 'shouldn\'t save with an invalid price' do
      category = Category.create(name: "Toys")
      price = Product.create(
        name: "Race Car",
        price: nil,
        quantity: 1,
        category: category
        )
      expect(price.errors.full_messages).to include "Price is not a number"
    end

    

  end
end