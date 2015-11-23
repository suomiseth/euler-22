require "pry-byebug"

class NameScores

  def initialize
    @abc = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  end

  def total_score
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