class Product
	attr_reader :title
	@@products = []

	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def add_to_products
		if (@@products.select { |product| product.title == @title }).count > 0
			raise DuplicateProductError, "#{@title} already exists."
		end
		@@products << self
	end

	def self.all
		@@products
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