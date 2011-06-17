require_relative 'chromosone'

class Population
	def initialize genes,size,fitness_function,seed
		@population = []
		build(genes, size, fitness_function )
		sort
	end
	
	# Removes the least fit from the population
	def cull limit
		limit.times do
			@population.pop
		end
	end

	def size
		@population.size
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

	def seed_population population

	end

	def build genes, size, fitness_function
		# Build the population
		size.times do
			# if population.size <= size
			@population.push Chromosone.new( genes.shuffle, fitness_function) 
			# end
		end
	end
end
