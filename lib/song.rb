class Song
  attr_accessor :name, :artist

  def initialize(name = nil)
    @name = name
  end

  def artist_name=(name)
    if self.artist.nil?
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
    self.artist.name
  end

  def self.new_by_filename(file_name)
    file = file_name.split(' - ')
    artist_name = file[0]
    song_name = file[1]
    genre = file[2].delete(".mp3")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    artist_name = Artist.find_or_create_by_name(artist_name)

    song
  end


end
