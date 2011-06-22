require_relative 'tsp/city'
require_relative 'genetics/gene'
require_relative 'genetics/population'

# Setup all the genes
genes = [
	Gene.new( City.new("New York, NY", 40.7833,-73.9667) ),
	Gene.new( City.new("Baltimore, MD", 39.1833,-76.6667) ),
	Gene.new( City.new("Seattle, WA", 47.65,-122.3) ),
	Gene.new( City.new("Chicago, IL", 41.7833,-87.75) ),
	Gene.new( City.new("Houston, TX", 29.9667,-95.35) ),
	Gene.new( City.new("Dallas, TX", 32.85,-96.85) ),
	Gene.new( City.new("Kennebunkport, ME",43.364627,-70.475063) ),
	Gene.new( City.new("Joliet, IL",41.53017,-88.080826) ),
	Gene.new( City.new("Minneapolis, MN", 44.991998,-93.262939) )]
	Gene.new( City.new("San Fransisco, CA",37.6167, -122.383))

# Limit the number of generations
max_generations = 30

# Population size
population_size = 50

# Fitness function for TSP
measure_fitness = lambda do |genes|
	distance = 0
	
	# Loop through the genes (cities) and measure the distance
	genes.size.times do |i|
		unless( i == genes.size-1)
			# Get the cities
			city1 = genes[i].gene_id
			city2 = genes[i+1].gene_id

			# Calculate the distance between the two cities
			city_distance = city1.distance_to(city2)

			# Add the distance to the total
			distance = distance + city_distance
		end
	end

	# Get the distance from the last city back to the origin
	last_city = genes[genes.size-1].gene_id
	origin = genes[1].gene_id
	distance = distance + last_city.distance_to(origin)

	distance
end

recombine_routes = lambda do |route1,route2|
	child_route = []

	while child_route.size <= route1.size do
		


	end
	
	route1.each do |gene|

		# Get the city from the gene
		city = gene.gene_id

		# Get the index of the city from route1 and route2
		route1_city_index = route1.index gene
		route2_city_index = route2.index gene

		# The next step from the city in route1 and route 2
		route1_next_step = nil
		route2_next_step = nil

		# Add city to the child route if not already there
		unless child_route.include? gene
			child_route.push gene
		end
		
		# Get route1's next step
		unless route1_city_index >= route1.size
			route1_next_step = route1[route1_city_index+1]
		end

		# Get route2's next step
		unless route2_city_index >= route2.size
			route2_next_step = route2[route2_city_index+1]
		end

	end




	route1.size.times do |i|
		
		gene = route1[i]
		city = gene.gene_id

		# Add city to the child route if not already there
		unless child_route.include? gene
			child_route.push gene
		end

		# From the current city, check which parent has the closest next step
		unless i >= route1.size
			# Get the next city in route1
			next_city = route1[i+1].gene_id
			
			# Get the distance between the two
			distance = city.distance_to(next_city)
		end

		# Get the index of the city in route 2
		route2_index = route2.index(gene)
	end
end

mutate_route = lambda do |city|

end

# Build the initial population
population = Population.new(genes,population_size,measure_fitness,[])

# Begin iterating through the generations
max_generations.times do |i|
	
	puts 
	puts
	puts "GENERATION #{i}:"
	puts
	puts population.first_fittest
	puts
	puts "================================================================================="

	# Create a seed population that will be used to see the next generation
	seed = []

	# Get the top two fittest parents from the population
	parent1 = population.first_fittest 
	parent2 = population.second_fittest 

	# Reproduce with the top parents
	#child1 = parent1.recombine parent2
	#child2 = parent2.recombine parent1

	cloned_child1 = parent1.clone
	cloned_child2 = parent2.clone

	mutated_child1 = parent1.clone
	mutated_child2 = parent2.clone

	mutated_child1.mutate
	mutated_child2.mutate

	# puts child1
	# puts child1 after mutation

	# Add the parents to the seed for the next population
	seed.push parent1
	seed.push parent2

	# Add the children to the seed for the next population
	#seed.push child1
	#seed.push child2
	
	#population = Population.new(genes, population_size,measure_fitness,seed)

	puts
	puts "Cloned Child 1"
	puts cloned_child1
	puts
	
	puts
	puts "Cloned Child 2"
	puts cloned_child2
	puts

	puts
	puts "Mutated Child 1"
	puts mutated_child1
	puts

	puts
	puts "Mutated Child 2"
	puts mutated_child2
	puts

	sleep(4)

end
