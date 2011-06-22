class Chromosone	
	attr_accessor :fitness_function
	attr_accessor :genes

	def initialize(genes,fitness_function)
		@genes = genes
		@fitness_function = fitness_function
	end

	def clone
		Chromosone.new(self.genes,self.fitness_function)
	end

	# Check the fitness of this chromosone by running the fitness_function
	def fitness	
		# Call the fitness function and pass in the
		# genes so the fitness can be measured
		#@fitness ||= 
		@fitness_function.call( self.genes ) # The equals/or caches the fitness value
	end

	# Compare the fitness of this chromosone and another. should return -1, 0, or 1
	def <=>(c)
		fitness <=> c.fitness
	end

	def to_s
		"Fitness: #{fitness} Route: #{ @genes } \n"
	end

	# Recombine with another chromosone to for a new one - reproduction
	def recombine chromosone
		
	end

	# Mutate the genes
	def mutate
		index1 = rand(@genes.size)
		index2 = rand(@genes.size)
		
		while index1 == index2
			index2 = rand(@genes.size)
		end 

		gene1 = @genes[index1]
		gene2 = @genes[index2]

		@genes[index1] = gene2
		@genes[index2] = gene1		
	end
	
end

