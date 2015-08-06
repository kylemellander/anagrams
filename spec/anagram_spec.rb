require('rspec')
require('anagram')

describe('/') {
  it("returns message if no anagrams") {
    expect("fox".anagram()).to(eq("There are no anagrams."))
  }
}
