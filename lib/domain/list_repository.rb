require "aws-sdk-dynamodb"

class ListRepository
  def initialize
    @table = Aws::DynamoDB::Table.new(TABLE_NAME)
  end

  def find_list_by_slug(slug)
    options = {
      key: {
        slug: slug
      }
    }
    item = table.get_item(options).item

    pairs = item["pairs"].map do |pair|
      Pair.new(question: pair["question"], answer: pair["answer"])
    end
    List.new(slug: item["slug"], title: item["title"], pairs: pairs)
  end

  def save_list(list)
    options = {
      item: {
        slug: list.slug,
        title: list.title,
        pairs: list.pairs.map(&:to_h)
      }
    }
    table.put_item(options)
  end

  private

  attr_reader :table

  TABLE_NAME = "lists"
  private_constant :TABLE_NAME
end
