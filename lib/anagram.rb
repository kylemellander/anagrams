class String
  def anagram(words=nil)
    if words == nil
      return "There are no anagrams."
    end

    anagrams = []

    origin_word_letters = self.split("").sort()
    words.each { |word|
      letters = word.split("").sort()
      anagrams << word if origin_word_letters == letters
    }

    if anagrams.empty?
      "There are no anagrams."
    else
      anagrams
    end
  end
end
