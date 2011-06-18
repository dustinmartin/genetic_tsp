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

# Build the initial population
population = Population.new(genes,population_size,measure_fitness,[])

#puts population
#exit

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
	child1 = parent1.reproduce parent2
	child2 = parent2.reproduce parent1

	# Add the parents to the seed for the next population
	seed.push parent1
	seed.push parent2

	# Add the children to the seed for the next population
	#seed.push child1
	#seed.push child2
	
	population = Population.new(genes, population_size,measure_fitness,seed)
end
