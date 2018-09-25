class MP3Importer

  attr_accessor :path
  attr_reader :files

  def initialize(path)
    @path = path
    @files = Dir.glob("#{@path}/**/*.mp3").map { |f| File.basename(f) }
  end

  def import
    @files.collect { |f| Song.new_by_filename(f) }
  end

end
