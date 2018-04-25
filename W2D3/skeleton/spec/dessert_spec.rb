require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:pudding) { Dessert.new("pudding", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pudding.type).to eq("pudding")
    end

    it "sets a quantity" do
      expect(pudding.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(pudding.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pudding", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pudding.add_ingredient("flour")
      pudding.add_ingredient("eggs")
      pudding.add_ingredient("sugar")
      expect(pudding.ingredients).to eq(["flour", "eggs", "sugar"])
    end
  end

  describe "#mix!" do

    it "shuffles the ingredient array" do
      expect(pudding.ingredients).to receive(:shuffle!)
      pudding.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pudding.eat(3)
      expect(pudding.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pudding.eat(15) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      pudding.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pudding)
      pudding.make_more
    end
  end
end
