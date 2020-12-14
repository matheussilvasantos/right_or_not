require "domain/list"

RSpec.describe List do
  describe ".initialize" do

    subject do
      List.new(title: "Find out the right plurals", pairs: [])
    end

    context "when I create an instace with a title" do
      it "has the slug field filled correctly" do
        expect(subject.slug).to eq("find-out-the-right-plurals")
      end
    end

    context "when I create an instance with a slug" do

      subject do
        List.new(slug: "random-slug", title: "Find out the right plurals", pairs: [])
      end

      it "has this slug" do
        expect(subject.slug).to eq("random-slug")
      end
    end
  end
end
