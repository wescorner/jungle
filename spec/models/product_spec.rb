require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully with all fields' do
      @category = Category.create(id: 1, name: "category")
      @product = Product.create(id: 1, name: "product", price: 100, quantity: 100, category: @category)
      expect(@product).to be_valid
    end
    it 'does not save without name field' do
      @category = Category.create(id: 1, name: "category")
      @product = Product.create(id: 1, price: 100, quantity: 100, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'does not save without price field' do
      @category = Category.create(id: 1, name: "category")
      @product = Product.create(id: 1, quantity: 100, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'does not save without quantity field' do
      @category = Category.create(id: 1, name: "category")
      @product = Product.create(id: 1, price: 100, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'does not save without category field' do
      @category = Category.create(id: 1, name: "category")
      @product = Product.create(id: 1, price: 100, quantity: 100)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
