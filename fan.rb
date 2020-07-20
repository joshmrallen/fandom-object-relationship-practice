class Fan
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        Fan.all << self
    end

    def self.all
        @@all
    end

    def fandoms
        Fandom.all.select do |fandom|
            fandom.fan == self
        end
    end

    def bands
        #display all the bands a particular fan is a fan of
        fandoms.map do |fandom|
            fandom.band
        end
    end

    def add_band(band)
        #adds a band to associate with the fan
        if bands.include?(band)
            puts "This fan is already a fan of this band."
        else
            Fandom.new(self, band)
        end
    end

end