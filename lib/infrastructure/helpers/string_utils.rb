module Helpers
  module StringUtils
    # Replaces special characters in a string so that it may be used as part of
    # a 'pretty' URL.
    #
    #   parameterize("Donald E. Knuth") # => "donald-e-knuth"
    #   parameterize("^très|Jolie-- ")  # => "tres-jolie"
    #
    # To use a custom separator, override the +separator+ argument.
    #
    #   parameterize("Donald E. Knuth", separator: '_') # => "donald_e_knuth"
    #   parameterize("^très|Jolie__ ", separator: '_')  # => "tres_jolie"
    #
    # To preserve the case of the characters in a string, use the +preserve_case+ argument.
    #
    #   parameterize("Donald E. Knuth", preserve_case: true) # => "Donald-E-Knuth"
    #   parameterize("^très|Jolie-- ", preserve_case: true) # => "tres-Jolie"
    #
    # It preserves dashes and underscores unless they are used as separators:
    #
    #   parameterize("^très|Jolie__ ")                 # => "tres-jolie__"
    #   parameterize("^très|Jolie-- ", separator: "_") # => "tres_jolie--"
    #   parameterize("^très_Jolie-- ", separator: ".") # => "tres_jolie--"
    def parameterize(string, separator: "-", preserve_case: false)
      parameterized_string = string.dup

      # Turn unwanted chars into the separator.
      parameterized_string.gsub!(/[^a-z0-9\-_]+/i, separator)

      unless separator.nil? || separator.empty?
        if separator == "-"
          re_duplicate_separator        = /-{2,}/
          re_leading_trailing_separator = /^-|-$/i
        else
          re_sep = Regexp.escape(separator)
          re_duplicate_separator        = /#{re_sep}{2,}/
          re_leading_trailing_separator = /^#{re_sep}|#{re_sep}$/i
        end
        # No more than one of the separator in a row.
        parameterized_string.gsub!(re_duplicate_separator, separator)
        # Remove leading/trailing separator.
        parameterized_string.gsub!(re_leading_trailing_separator, "")
      end

      parameterized_string.downcase! unless preserve_case
      parameterized_string
    end
  end
end
