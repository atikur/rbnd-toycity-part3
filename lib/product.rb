class Product
	attr_reader :title, :price, :stock
	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end

	def add_to_products
		if (@@products.select { |product| product.title == @title }).count > 0
			raise DuplicateProductError, "#{@title} already exists."
		end
		@@products << self
	end

	def in_stock?
		return @stock > 0
	end

	def self.all
		@@products
	end

	def self.in_stock
		@@products.select { |product| product.in_stock? }
	end

	def self.find_by_title(title)
		@@products.each do |product|
			if product.title == title
				return product
			end
		end
		return nil
	end
end