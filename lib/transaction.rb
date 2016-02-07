class Transaction
	attr_reader :id, :product, :customer

	@@id = 1

	def initialize(customer, product)
		@product = product
		@customer = customer
		@id = @@id
		@@id += 1

		@product.sell
	end
end