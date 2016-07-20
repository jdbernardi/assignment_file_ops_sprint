# Create a DictionaryUI class to handle the user interaction loop. The first prompt is for the location of your dictionary file.

# DictionaryUI
	# @file_name
	# initializes :
		# DictionaryLoader
		# DictionarySearcher
		# DictionarySaver
	# prompts the user for the file
	# prompts the user for saving the file
	# asks the user overwrite file
	# raises errors if no file is found

	# displays results from DictionarySearches

# DictionaryLoader
	# loads the file
	# creates the Dictionary
	# reads the file
	# determines # words
	# determines # words starting letters

# Dictionary
	# intializes instance of dictionary ( file )


# DictionarySearcher
	# takes instance of Dictionary
	# exact_matches
	# partial_matches
	# begins_with
	# ends with

# DictionarySaver
	# takes the name to save
	# takes in the file to save
	# checks if that file exists
	# takes in the mode to save

require_relative 'DictionaryLoader'
require_relative 'DictionarySearcher'
require_relative 'ResultsSaver'
require_relative 'Dictionary'
require 'pry'


class DictionaryUI

	attr_reader :loader, :searcher

	def initialize

		@loader = DictionaryLoader.new
		@searcher = DictionarySearcher.new
		#@saver = ResultsSaver.new

	end


	def run

		loop do
			# put into a loop that checks in loader if file exists
			prompt_for_file_location

			break if @loader.valid_file_path?( get_location_of_file )

		end

		@loader.load


	end



	def prompt_for_file_location

		puts "Please enter the location of your file."

	end



	def get_location_of_file

		return gets.strip

	end



end #/.DictionaryUI

d = DictionaryUI.new
d.run