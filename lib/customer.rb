class Customer
	attr_reader :name

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_list
	end

	def add_to_list
		if (@@customers.select{ |customer| customer.name == @name }).count > 0 
			raise DuplicateCustomerError, "#{@name} already exists."
		end
		@@customers << self
	end

	def purchase(product)
		Transaction.new(self, product)
	end

	def print_transactions_history
		transactions = Transaction.all.select { |transaction| transaction.customer == self }

		puts "------------------------------------"
		puts "Transaction History (#{@name})"
		puts "------------------------------------"

		transactions.each do |transaction|
			puts "Transaction ID: #{transaction.id}, Product: #{transaction.product.title}"
		end
	end

	def self.find_by_name(name)
		@@customers.each do |customer| 
			if customer.name == name
				return customer
			end
		end
		return nil
	end

	def self.all
		@@customers
	end
end