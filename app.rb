require('sinatra')
require('sinatra/reloader')
require('./lib/anagram')
also_reload('lib/**/*.rb')

get ('/') {
  erb(:index)
}

get ('/anagrams') {
  if params.empty?
    erb(:index)
  else
    @original_word_error = 1 if params.fetch('origin_word') == ""
    @possible_anagrams_error = 1 if params.fetch('possible_anagrams') == ""
    @original_word = params.fetch('origin_word')
    @original_anagrams = params.fetch('possible_anagrams')
    @possible_anagrams = params.fetch('possible_anagrams').gsub(/\s+/, "").split(",")

    if @original_word_error != 1 && @possible_anagrams_error != 1
      @results = @original_word.anagram(@possible_anagrams)
      erb(:results)
    else
      erb(:index)
    end
  end
}
