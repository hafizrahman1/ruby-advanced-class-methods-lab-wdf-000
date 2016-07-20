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
    #song.name = name
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #song.save
    song

  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    #song.save create already save the song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song_name|
      song_name.name == name
      
    end
  end

  def self.find_or_create_by_name(song_name)

    self.find_by_name(song_name) || self.create_by_name(song_name)

    # if self.all.include?(name)
    #   self.all
    # else
    #   self.create_by_name(name)
    # end
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

    # solution
    # parts = filename.split(" - ")
    # artist_name = parts[0]
    # song_name = parts[1].gsub(".mp3", "")

    # song = self.new
    # song.name = song_name
    # song.artist_name = artist_name
    # song

  end

  def self.create_from_filename(filename)
    file_array = filename.split(/[-.]/)
    song = self.new
    song.name = file_array[1].strip
    song.artist_name = file_array[0].strip
    song.save

    #solution
    # parts = filename.split(" - ")
    # artist_name = parts[0]
    # song_name = parts[1].gsub(".mp3", "")

    # song = self.create
    # song.name = song_name
    # song.artist_name = artist_name
    # song

  end

  def self.destroy_all
    self.all.clear
  end


end
