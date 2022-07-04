class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end


  def self.new_by_name(input)
    song = self.new
    song.name = input
    song
  end
  
  def self.create_by_name(input)
    song = self.create
    song.name = input
    song
  end

  def self.find_by_name(input)
    self.all.find{|song| song.name == input}
  end

  def self.find_or_create_by_name(input)
    self.find_by_name(input) || self.create_by_name(input)
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(file)
    filename = file.slice! ".mp3"
    filenameArrray = file.split(" - ")
    song_artist = filenameArrray[0]
    song_name = filenameArrray[1]

    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song

  end


  def self.create_from_filename(file)
    filename = file.slice! ".mp3"
    filenameArrray = file.split(" - ")
    song_artist = filenameArrray[0]
    song_name = filenameArrray[1]

    song = self.create
    song.name = song_name
    song.artist_name = song_artist
    song
  end

  def self.destroy_all
    self.all.clear
  end




end
