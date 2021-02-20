require 'pry'

class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
         @@all
    end

   # def self.artist=(artist)
   #   @artist = artist
   # end

    def artist_name= (artist)
      self.artist = Artist.find_or_create_by_name(artist)
    end
        
    def self.new_by_filename(file)
      new_song =  self.new(file.split(" - ")[1])
     artist_name = file.split(" - ")[0]
      new_song.artist = Artist.new(artist_name)
      new_song
    end

    def songs
        @@all
    end
end          