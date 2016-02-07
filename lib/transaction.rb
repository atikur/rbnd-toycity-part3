class Transaction
	attr_reader :id, :product, :customer

	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@product = product
		@customer = customer
		@id = @@id
		@@id += 1

		@product.sell
		@@transactions << self
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		@@transactions.each do |transaction|
			if transaction.id == id
				return transaction
			end
		end
		return nil
	end
end