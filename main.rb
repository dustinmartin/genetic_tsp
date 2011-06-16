require 'pp'
require_relative 'tsp/city'
require_relative 'genetics/gene'
require_relative 'genetics/population'

=begin
boston = City.new()
miami = City.new()
phoenix = City.new()
st_louis = City.new()
nashville = City.new()
louisville = City.new()
atlanta = City.new()
los_angeles = City.new()
san_fransisco = City.new()
portland = City.new()
salt_lake_city = City.new()
boise = City.new()
minneapolis = City.new()
=end

# Setup all the genes
genes = [
	Gene.new( City.new("New York, NY", 40.7833,-73.9667) ),
	Gene.new( City.new("Baltimore, MD", 39.1833,-76.6667) ),
	Gene.new( City.new("Seattle, WA", 47.65,-122.3) ),
	Gene.new( City.new("Chicago, IL", 41.7833,-87.75) ),
	Gene.new( City.new("Houston, TX", 29.9667,-95.35) ),
	Gene.new( City.new("Dallas, TX", 32.85,-96.85) )
]

# Limit the number of generations
generations = 100

# Population size
population_size = 10

# Fitness function for TSP
measure_fitness = proc do |genes|
	distance = 0
	
	# Loop through the genes
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

	distance
end

# Build the population
population = Population.new(genes,population_size,measure_fitness)

=begin
Evolver.run(
	:genes => genes, 
	:population_size => 50,
	:max_generations => 100,
	:fitness_function => measure_fitness,
	:crossover_probability => 85,
	:mutation_probability => 5
)
=end

#PP.pp( population )
puts population
puts
puts
puts population.first_fittest
puts population.second_fittest


parent1 = population.first_fittest
parent2 = population.second_fittest

child1 = parent1.recombine(parent2)
child2 = parent2.recombine(parent1)




# Loop through the chromosone population
#population.each do |chromosone|
	
#	chromosone.fitness_function = measure_distance

#	puts chromosone.fitness

#end