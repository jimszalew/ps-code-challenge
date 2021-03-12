require 'rails_helper'

describe PostCode do
    Cafe.destroy_all
    post_code1 = PostCode.new("LS2 3AW")
    post_code2 = PostCode.new("LS1 6BR")
    cafe1 = Cafe.create!(name: "Kenny Rogers Coffee Roasters", address: "abc", post_code: post_code1.code, chairs: 24)
    cafe2 = Cafe.create!(name: "Cup of Joel", address: "def", post_code: post_code1.code, chairs: 14)
    cafe3 = Cafe.create!(name: "Big Place", address: "xyz", post_code: post_code2.code, chairs: 42)
    
    it "has a code and cafes" do
        expect(post_code1.code).to eq("LS2 3AW")
        expect(post_code1.places).to eq([cafe1, cafe2])
    end

    it "calculates total_places in that post code" do
        expect(post_code1.total_places).to eq(2)
    end

    it "calculates total_chairs in that post code" do
        expect(post_code1.total_chairs).to eq(38)
    end

    it "calculates chair percentage out of all post codes" do
        expect(post_code1.chair_pct).to eq(47.5)
    end

    it "finds the cafe with the most chairs" do
        expect(post_code1.place_with_max_chairs).to eq(cafe1)
    end

    it "shows the number of chairs at the place with the most chairs" do
        expect(post_code1.max_chairs).to eq(24)
    end
end