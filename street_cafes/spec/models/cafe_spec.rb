require 'rails_helper'

describe Cafe do
    Cafe.destroy_all
    
    ls1_small_cafe = Cafe.create!(name: 'Kenny Rogers Roasters', address: 'abc', post_code: 'LS1 5BN', chairs: 4)
    ls1_med_cafe = Cafe.create!(name: 'Cup of Joel', address: 'def', post_code: 'LS1 2AT', chairs: 10)
    ls1_large_cafe = Cafe.create!(name: 'Big Place', address: 'xyz', post_code: 'LS1 5HU', chairs: 102)
    
    ls2_small_cafe = Cafe.create!(name: 'Bing', address: 'ghi', post_code: 'LS2 5BN', chairs: 8)
    ls2_large_cafe = Cafe.create!(name: 'Meeting Space', address: 'mno', post_code: 'LS2 5HU', chairs: 120)
    ls2_cafe1 = Cafe.create!(name: 'cafe1', address: 'vbn', post_code: 'LS2 3QR', chairs: 66)
    ls2_cafe2 = Cafe.create!(name: 'cafe2', address: 'fgh', post_code: 'LS2 1AB', chairs: 22)
    ls2_cafe3 = Cafe.create!(name: 'cafe3', address: 'rty', post_code: 'LS2 9NM', chairs: 15)
    ls2_cafe4 = Cafe.create!(name: 'cafe4', address: 'ert', post_code: 'LS2 8JS', chairs: 80)
        
    ls2_cafes = Cafe.where("cafes.post_code LIKE 'LS2 %'")

    ls10_other = Cafe.create!(name: 'Gonzo', address: 'pqr', post_code: 'LS10 6TY', chairs: 120)

    ls2_mean = ls2_cafes.sum(:chairs) / ls2_cafes.count

    describe 'ls1_size' do
        it 'sets ls1 category and size' do
            expect(ls1_small_cafe.ls1_size).to eq('ls1_small')
            expect(ls1_med_cafe.ls1_size).to eq('ls1_medium')
            expect(ls1_large_cafe.ls1_size).to eq('ls1_large')
        end
    end
    
    describe 'ls2_size' do
        it 'sets ls2 category and size' do
            expect(ls2_small_cafe.ls2_size(ls2_mean)).to eq('ls2_small')
            expect(ls2_large_cafe.ls2_size(ls2_mean)).to eq('ls2_large')
        end
    end
end