require('sinatra')
require('sinatra/reloader')
require('./lib/anagram')
also_reload('lib/**/*.rb')

get ('/') {
  erb(:index)
}

get ('/anagrams') {
  if !params.fetch("origin_word")
    @original_word_error = 1
  elsif !params.fetch("possible_anagrams")
    @possible_anagrams_error = 1
  else
    @original_word = params.fetch("origin_word")
    @possible_anagrams = params.fetch("possible_anagrams").gsub(/\s+/, "").split(",")
    @results = @original_word.anagram(@possible_anagrams)
    erb(:results)
  end
  if @original_word_error = 1 || @possible_anagrams_error = 1
    erb(:index)
  end
}
