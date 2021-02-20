require 'pry'

class Artist
    attr_accessor :name, :song
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        existing_artist = self.all.find {|artist| artist.name == name}
          if existing_artist
            existing_artist
          else
            new_artist = self.new(name)
            new_artist
          end
       
    end
    def print_songs
        songs.each {|song| puts song.name}
    end



end