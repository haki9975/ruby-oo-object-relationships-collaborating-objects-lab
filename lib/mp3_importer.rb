require 'pry'

class MP3Importer
    attr_accessor :path
    @@all = []
    def initialize(file_path)
      @path =  Dir[file_path]
    end
    
    def path
        "./spec/fixtures/mp3s"
    end
    
    def files
       files = []
       Dir.each_child(@path[0]) { |file| files << file }
       files
    end

    def import
      files.each { |song| Song.new_by_filename(song) }
    end


end