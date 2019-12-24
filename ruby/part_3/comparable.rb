class Song
  include Comparable

  attr_accessor :length

  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end

  def <=>(other)
    @length <=> other.length
  end
end

a = Song.new('Rock around the clock', 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)

puts a > b
puts a.between?(c, b)
