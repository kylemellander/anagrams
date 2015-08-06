require('sinatra')
require('sinatra/reloader')
require('./lib/anagram')
also_reload('lib/**/*.rb')

get ('/') {
  erb(:index)
}

get ('/anagrams') {
  @original_word = params.fetch("origin_word")
  @possible_anagrams = params.fetch("possible_anagrams").gsub(/\s+/, "").split(",")
  @results = @original_word.anagram(@possible_anagrams)
}
