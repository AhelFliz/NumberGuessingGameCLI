#!/usr/bin/env ruby

puts "="*40
puts "Welcome to the Number Guessing Game! \nI'm thinking of a number between 1 and 100. \nYou have X chances to guess the correct number."
puts "="*40


difficulty_levels = {
	1 => {difficulty: "Easy", chances: 10},
	2 => {difficulty: "Medium", chances: 5},
	3 => {difficulty: "Hard", chances: 3}
}

difficulty_selected = 0

puts "Please select the difficulty level:"
while !difficulty_selected.between?(1, 3)
	puts <<~MENU
  1. Easy   (10 chances)
  2. Medium (5 chances)
  3. Hard   (3 chances)
	MENU
	print "Enter your choice: "
	difficulty_selected = gets.chomp.to_i

	if !difficulty_selected.between?(1, 3)
		puts "\nPlease select a correct number"
	else
		selected = difficulty_levels[difficulty_selected]
	end
end

puts "\nGreat! You have selected the #{selected[:difficulty]} difficulty"
puts "Let's start the game!"

random_number_generated = rand(1..100)
attempts = 0

while attempts != selected[:chances]
	print "\nEnter your guess: "
	number_input = gets.chomp.to_i
	attempts += 1

	if number_input == random_number_generated
		puts "🎉 Congratulations! You guessed the correct number in #{attempts} attempts."
		break
	elsif number_input > random_number_generated
		puts "❌ Too high!"
	else
		puts "❌ Too low!"
	end

	puts "You have #{selected[:chances] - attempts} attempts left" unless number_input == random_number_generated
end

if attempts == selected[:chances] && number_input != random_number_generated
	puts "No attempts left. The correct number was #{random_number_generated}."
end



