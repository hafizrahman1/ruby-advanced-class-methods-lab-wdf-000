require 'pry'
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
    song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song

  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song_name|
      song_name.name == name
      
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(name)
      self.all
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end

  end

  def self.new_from_filename(filename)
    file_array = filename.split(/[-.]/)
    song = self.new
    song.name = file_array[1].strip
    song.artist_name = file_array[0].strip
    song
  end

  def self.create_from_filename(filename)
    file_array = filename.split(/[-.]/)
    song = self.new
    song.name = file_array[1].strip
    song.artist_name = file_array[0].strip
    song.save

  end

  def self.destroy_all
    self.all.clear
  end


end
