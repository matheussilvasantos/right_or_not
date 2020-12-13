module Helpers
  module View
    def title
      if @title.nil? || @title.empty?
        "Right or not"
      else
        "Right or not | #{@title}"
      end
    end

    def title=(new_title)
      @title = new_title
    end
  end
end
