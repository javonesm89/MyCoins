class User < ApplicationRecord
    validates :name, :presence => true 
    validates :email, :presence => true, :uniqueness => true
    validates :password, :presence => true, :length => {:minimum => 3}
    
    has_secure_password

    has_many :strategies
    has_many :actions, through: :strategies


    def adjust_for_taxes
        case self.salary
        when (10001..40000)
            taxable_amount = salary - 10000
            money_to_sam = taxable_amount * 0.12 + 1000
            binding.pry
            new_salary = salary - money_to_sam
        when (40001..90000)
            taxable_amount = salary - 40000
            money_to_sam = taxable_amount * 0.22 + 4700
            new_salary = salary - money_to_sam
        when (90001..180000)
            taxable_amount = salary - 90000
            money_to_sam = (taxable_amount * 0.24) + (14700)
            # binding.pry
            new_salary = salary - money_to_sam
        when (180001..300000)
            taxable_amount = salary - 180000
            money_to_sam = (taxable_amount * 0.22) + (1000)
            new_salary = salary - money_to_sam
        when (300001..500000)
            taxable_amount = salary - 10000
            money_to_sam = taxable_amount * 0.22 + 1000
            new_salary = salary - money_to_sam
        else (0..10)
            nil
            # taxable_amount = salary - 10000
            # money_to_sam = taxable_amount * .22 + 1,000
            # new_salary = salary - money_to_sam
        end
    end

    def medicare_tax(salary)
        if salary >= 200000
            medicare_tax = 0.145
        else
            medicare_tax = 0.29 
        end 
    end

    def social_security_tax
        social_security_tax = 6.2
    end
end
