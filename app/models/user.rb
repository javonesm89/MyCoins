class User < ApplicationRecord
    validates :name, :presence => true 
    validates :email, :presence => true, :uniqueness => true
    validates :password, :presence => true, :length => {:minimum => 3}
    
    has_secure_password

    has_many :strategies
    has_many :actions, through: :strategies


    def adjust_for_taxes
        binding.pry
        salary = self.salary
        case salary
        when 10001..40000
            taxable_amount = salary - 10000
            money_to_sam = taxable_amount * .12 + 1,000
            new_salary = salary - money_to_sam
        when 40001..90000
            taxable_amount = salary - 40000
            money_to_sam = taxable_amount * .22 + 4,700
            new_salary = salary - money_to_sam
        when 90001..180000
            taxable_amount = salary - 90000
            money_to_sam = taxable_amount * .24 + 14,700
            new_salary = salary - money_to_sam
        when 180,001..300,000
            taxable_amount = salary - 180000
            money_to_sam = taxable_amount * .22 + 1,000
            new_salary = salary - money_to_sam
        when 300,001..500000
            taxable_amount = salary - 10000
            money_to_sam = taxable_amount * .22 + 1,000
            new_salary = salary - money_to_sam
        else 0..10
            taxable_amount = salary - 10000
            money_to_sam = taxable_amount * .22 + 1,000
            new_salary = salary - money_to_sam
        end
    end
end
