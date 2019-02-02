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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(looking_for)
    found_song = self.all.detect {|song| song.name == looking_for}
    if found_song == nil
      self.create_by_name(looking_for)
    else
      self.find_by_name(looking_for)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    file = filename.chomp(".mp3")
    name_artist = file.split(" - ")
    artist = name_artist[0]
    name = name_artist[1]
    song.name = name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    file = filename.chomp(".mp3")
    name_artist = file.split(" - ")
    artist = name_artist[0]
    name = name_artist[1]
    song.name = name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
