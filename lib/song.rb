class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song_file = File.basename(filename, '.mp3').split(' - ')
    song = self.new(song_file[1])
    song.artist_name = song_file[0]
    song
  end
end
