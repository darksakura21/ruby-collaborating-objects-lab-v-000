class MP3Importer
  attr_accessor :path
  def initialize(file)
    @path = file
  end

  def files
    Dir.entries("#{self.path}").select{|file| !File.directory? file}
  end

  def import
    self.files.each{|file| Song.new_by_filename(file)}
      # mp3 = file.split('-')
      # artist = mp3[0]
      # song = mp3[1]
      # genre = mp3[2].delete(".mp3")
  end
end
