class Band
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        Band.all << self
    end

    def self.all
        @@all
    end

    def self.most_popular
        Band.all.max_by do |band|
            band.fans.length
        end
    end

    def fandoms
        Fandom.all.select do |fandom|
            fandom.band == self
        end
    end

    def fans
        fandoms.map do |fandom|
            fandom.fan
        end
    end

    def num_fans
        fans.length
    end

    def add_fan(fan)
        #adds fan to the band's following
        if fans.include?(fan)
            puts "This fan is already a fan."
        else
            Fandom.new(fan, self)
        end
    end

end