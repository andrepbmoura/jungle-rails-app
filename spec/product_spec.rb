require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it 'is valid with valid attributes' do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: 'Test', price: 10, quantity: 2, category: @category)
        expect(@category).to be_valid
        expect(@product).to be_valid
      end
  
      it 'is not valid without a name' do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: nil, price: 10, quantity: 2,category: @category)
        expect(@product).to_not be_valid
      end
  
      it 'is not valid without a price' do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: 'Test', price: nil, quantity: 2,category: @category)
        expect(@product).to_not be_valid
      end
  
      it 'is not valid without a quantity' do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: 'Test', price: 10, quantity: nil, category: @category)
        expect(@product).to_not be_valid
      end
  
      it 'is not valid without a category' do
        @category = Category.new(name: 'Test')
        @product = Product.new(name: 'Test', price: 10, quantity: 2, category: nil)
        expect(@product).to_not be_valid
      end
  end
end

