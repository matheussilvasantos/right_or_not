require "infrastructure/helpers/string_utils"

class List
  include Helpers::StringUtils

  attr_reader :slug, :title, :pairs

  def initialize(slug: nil, title:, pairs:)
    @title = title
    @pairs = pairs
    @slug = slug || parameterize(title)
  end
end
