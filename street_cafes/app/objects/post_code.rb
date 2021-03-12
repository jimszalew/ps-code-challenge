class PostCode
    attr_reader :code, :places
    def initialize(code)
        @code = code
        @places = Cafe.where(post_code: code)
    end

    def total_places
        places.count
    end

    def total_chairs
        places.sum(:chairs)
    end

    def chair_pct
        all_cafe_chairs = Cafe.sum(:chairs)
        (self.total_chairs.to_f / all_cafe_chairs.to_f) * 100
    end

    def place_with_max_chairs
        places.order(chairs: :desc).first
    end

    def max_chairs
        self.place_with_max_chairs.chairs
    end
end