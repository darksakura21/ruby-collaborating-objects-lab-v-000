class Artist
  attr_accessor :name, :songs, :song

  @@all = []


  def initialize(name = nil)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    Artist.all << self
  end

  def add_song(song)
    song = Song.new(song)
    song.artist = self
    self.songs << song.name
  end

  def self.find_or_create_by_name(name)
      result = Artist.all.detect do |artist|
        artist.name == name
      end

      result || self.new(name)
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

end
