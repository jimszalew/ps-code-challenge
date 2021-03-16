class Cafe < ApplicationRecord
    self.table_name = "cafes"

    before_save :group_ls2 
    before_save :categorize

    def group_ls2
        byebug
    end

    def categorize
        byebug
        if self.post_code.include?("LS1 ")
            ls1_size
        elsif self.post_code.include?("LS2 ")
            ls2_size
        else
            self.category = "other"
        end
    end

    def ls1_size
        if self.chairs < 10
            self.category = "ls1_small"
        elsif self.chairs.between?(10,99)
            self.category = "ls1_medium"
        elsif self.chairs >= 100
            self.category = "ls1_large"
        end
    end

    def ls2_size
        
        byebug
        self.category = "ls2_small"
        self.category = "ls2_large"
    end
end
