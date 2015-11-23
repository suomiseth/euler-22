# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

require "pry-byebug"

class NameScores

  def initialize
    @abc = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  end

  def total_score
    binding.pry
    score(name_arr).inject(:+)
  end

  def name_arr
    File.read("./p022_names.txt").gsub("\"", "").split(",").sort
  end

  def score(arr)
    arr.map.with_index {|name, i| name_score(name) * (i + 1)}
  end

  def name_score(name)
    name.split("").inject(0) {|sum, lttr| @abc.index(lttr.downcase) + 1 + sum}
  end
end

puts "reading file and crunching nubmers"
puts NameScores.new.total_score