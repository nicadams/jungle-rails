require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here


    it "must require a name, price, quantity, category" do
      @category = Category.create!
      @product = Product.create!(
        name: 'blah',
        price: 3,
        quantity: 1,
        category: @category
      )
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present
    end

    it "Product name can't be blank" do
      @category = Category.create!
      @product = Product.create!(
        name: nil,
        price: 3,
        quantity: 1,
        category: @category
      )
      expect(@product.errors.full_messages).to include "Product name can't be blank"

    end

    it "Product price can't be blank" do
      @category = Category.create!
      @product = Product.create!(
        name: 'blah',
        price: nil,
        quantity: 1,
        category: @category
      )
      expect(@product.errors.full_messages).to include "Product price can't be blank"

    end

    it "Product quantity can't be blank" do
      @category = Category.create!
      @product = Product.create!(
        name: 'blah',
        price: 3,
        quantity: nil,
        category: @category
      )
      expect(@product.errors.full_messages).to include "Product quantity can't be blank"

    end

    it "Product category can't be blank" do
      @category = Category.create!
      @product = Product.create!(
        name: 'blah',
        price: 3,
        quantity: 1,
        category: nil
      )
      expect(@product.errors.full_messages).to include "Product category can't be blank"

    end


  end
end
