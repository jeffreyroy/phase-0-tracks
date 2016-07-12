# Virus Predictor

# I worked on this challenge [with: Evelyn Nabicht].
# We spent [1] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative incorporates the contents of another file, using
# a path relative to the location of this file.
#
require_relative 'state_data'

class VirusPredictor
# defines parameters for class and sets parameters to instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
# calls predicted deaths and speed of spread methods

  def virus_effects
    predicted_deaths #(@population_density, @population, @state)
    speed_of_spread #(@population_density, @state)
  end

  private
# predicts deaths based on population density and population and prints it
  def predicted_deaths #(population_density, population, state)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      multiplier = 0.4
    elsif @population_density >= 150
       multiplier = 0.3
    elsif @population_density >= 100
       multiplier = 0.2
    elsif @population_density >= 50
       multiplier = 0.1
    else
      multiplier = 0.05
    end
    number_of_deaths = (@population * multiplier).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
# predicts speed of spread based off population and prints it
  def speed_of_spread #(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


#alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
#alabama.virus_effects

#jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
#jersey.virus_effects

#california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
#california.virus_effects

#alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
#alaska.virus_effects


STATE_DATA.each do |state, state_info|
  state_predictor = VirusPredictor.new(state, state_info[:population_density], state_info[:population])
  state_predictor.virus_effects
end
#=======================================================================
# Reflection Section
=begin

1. What are the differences between the two different hash syntaxes
shown in the state_data file?

The first hash uses the => operator to assign a value to a key, where
the key is a string.  The second uses a colon : to assign a value to a key,
where the key is a symbol.

2. What does require_relative do? How is it different from require?

The require_relative command incorporates the contents of another file, using a path
relative to the location of the present file.  The require command does the
same thing, but uses an absolute path rather than a relative path.

3. What are some ways to iterate through a hash?

The easiest way is to use variations on the 'each' method, like each, each_key,
each_pair, and so on.

4. When refactoring virus_effects, what stood out to you about the variables,
if anything?

The variables were instance variables, so they didn't need to be passed as parameters
to the instance methods.

5. What concept did you most solidify in this challenge?

The main thing was variable scope, i.e. the difference between constants, global variables,
and instance variables.

=end
