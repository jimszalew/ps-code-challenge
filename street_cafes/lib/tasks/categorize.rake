desc "Categorize Cafes by Post Code and Number of Chairs"
namespace :development do
    task :categorize => :environment do
        ls1_cafes = Cafe.where("cafes.post_code LIKE 'LS1 %'")
        ls2_cafes = Cafe.where("cafes.post_code LIKE 'LS2 %'")
        other_cafes = Cafe.where.not("cafes.post_code LIKE 'LS1 %'").where.not("cafes.post_code LIKE 'LS2 %'")

        ls2_mean = ls2_cafes.sum(:chairs) / ls2_cafes.count

        ls1_cafes.map do |cafe|
            cafe.ls1_size
            cafe.save
        end

        ls2_cafes.map do |cafe|
            cafe.ls2_size(ls2_mean)
            cafe.save
        end

        other_cafes.map do |cafe|
            cafe.category = "other"
            cafe.save
        end
    end
end