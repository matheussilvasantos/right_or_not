require "infrastructure/helpers/string_utils"

class List
  include Helpers::StringUtils

  attr_reader :slug, :title, :pairs

  def initialize(title:, pairs:)
    @title = title
    @pairs = pairs
    @slug = parameterize(title)
  end
end
