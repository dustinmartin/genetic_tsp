require_relative 'chromosone'

class Population
	def initialize genes,size,fitness_function #, base_population
		@population = []
		
		# cull_limit = base_population.size
		# cull_population
		# load_base_population
		build(genes, size, fitness_function )
		sort
	end
	
	def each 
		@population.each do |x|
			yield x
		end
	end

	def sort
		@population.sort! do |x, y| 
			x <=> y
		end
	end

	def first_fittest
		@population[0]
	end

	def second_fittest
		@population[1]
	end

	def to_s
		" #{@population} "
	end

	private

	def build genes, size, fitness_function
		# Build the population
		size.times do
			# if population.size <= size
			@population.push Chromosone.new( genes.shuffle, fitness_function) 
			# end
		end
	end
end
