require "domain/pair"

RSpec.describe Pair do
  context "#to_h" do
    subject do
      Pair.new(question: "scarf", answer: "scarves").to_h
    end

    it "returns the attributes as a hash" do
      expect(subject[:question]).to eq("scarf")
      expect(subject[:answer]).to eq("scarves")
    end
  end
end
