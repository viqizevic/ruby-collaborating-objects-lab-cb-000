class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    @@all.find { |a| a.name == name } || self.new(name)
  end

  def print_songs
    @songs.each { |s| puts s.name }
  end

end
