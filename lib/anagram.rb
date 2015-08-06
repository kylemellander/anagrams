class String
  def anagram(words=nil)
    if words == nil
      return "You didn't input any possible anagrams."
    end

    anagrams = []

    origin_word_letters = self.downcase.split("").sort()
    words.each { |word|
      letters = word.downcase.split("").sort()
      anagrams << word if origin_word_letters == letters
    }

    if anagrams.empty?
      "There are no anagrams."
    else
      anagrams
    end
  end
end
