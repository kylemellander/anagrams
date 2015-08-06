require('rspec')
require('anagram')

describe('/') {
  it("returns message if no argument is passed") {
    expect("fox".anagram()).to(eq("You didn't input any possible anagrams."))
  }

  it("returns message if no anagrams are found") {
    expect("fox".anagram(["duck", "hippo"])).to(eq("There are no anagrams."))
  }

  it("returns the anagram if 1 argument is given and is an anagram") {
    expect("fox".anagram(["xfo"])).to(eq(["xfo"]))
  }

  it("returns the anagram if multiple arguments given and only one is an anagram") {
    expect("fox".anagram(["xfo", "fff", "asg"])).to(eq(["xfo"]))
  }

  it("returns proper anagrams in mixed case inputs") {
    expect("FoX".anagram(["xFo", "fff", "asg"])).to(eq(["xFo"]))
  }
}
