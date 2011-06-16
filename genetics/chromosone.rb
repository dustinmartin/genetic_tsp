class Chromosone	
	attr_accessor :fitness_function
	attr_accessor :genes

	def initialize(genes,fitness_function)
		@genes = genes
		@fitness_function = fitness_function
	end

	# Check the fitness of this chromosone by running the fitness_function
	def fitness	
		# Call the fitness function and pass in the
		# genes so the fitness can be measured
		@fitness ||= @fitness_function.call( @genes ) # The equals/or caches the fitness value
	end

	# Recombine with another chromosone to for a new one - reproduction
	def recombine chromosone
		
	end

	# Mutate the genes
	def mutate genes

	end

	# Compare the fitness of this chromosone and another. should return -1, 0, or 1
	def <=>(c)
		return fitness <=> c.fitness
	end

	def to_s
		return "Fitness: #{fitness} \n Route: #{ @genes }"
	end

end

