class Cafe < ApplicationRecord
    self.table_name = "cafes"

    def ls1_size
        if self.chairs < 10
            self.category = "ls1_small"
        elsif self.chairs.between?(10,99)
            self.category = "ls1_medium"
        elsif self.chairs >= 100
            self.category = "ls1_large"
        end
    end

    def ls2_size(mean)
        if self.chairs <= mean
            self.category = "ls2_small"
        else
            self.category = "ls2_large"
        end
    end

    def other_cat
        self.category = "other"
    end
end
