require('sinatra')
require('sinatra/reloader')
require('./lib/anagram')
also_reload('lib/**/*.rb')

get ('/') {
  erb(:index)
}

get ('/anagrams') {
  @original_word_error = 1 if params.fetch('origin_word') == ""
  @possible_anagrams_error = 1 if params.fetch('possible_anagrams') == ""

  if @original_word_error != 1 && @possible_anagrams_error != 1
    @original_word = params.fetch('origin_word')
    @possible_anagrams = params.fetch('possible_anagrams').gsub(/\s+/, "").split(",")
    @results = @original_word.anagram(@possible_anagrams)
    erb(:results)
  else
    erb(:index)
  end
}
