#http://www.reddit.com/r/dailyprogrammer/comments/3aqvjn/20150622_challenge_220_easy_mangling_sentences/

def mangle(sentence)
	words = sentence.split
	mangled_words = []
	words.each do |word|
		chars = word.split("")
		interpunction_data = {}
		capital_indices = []
		letters = []
		sorted_word = []
		chars.each_with_index do |char, i|
			interpunction_data[i] = char if char =~ /[[:punct:]]/
			capital_indices << i if char =~ /[A-Z]/
			letters << char.downcase if char =~ /[a-z]/i
		end
		letters.sort!
		word.length.times do |i|
			if (interpunction_data[i])
				sorted_word << interpunction_data[i]
			else
				letter = letters.shift
				if capital_indices[0] == i
					letter.upcase!
					capital_indices.shift
				end 
				sorted_word << letter
			end
		end
		mangled_words << sorted_word.join
	end
	mangled_words.join(" ")
end

inputs = [
	"This challenge doesn't seem so hard.",
	"There are more things between heaven and earth, Horatio, than are dreamt of in your philosophy.",
	"Eye of Newt, and Toe of Frog, Wool of Bat, and Tongue of Dog.",
	"Adder's fork, and Blind-worm's sting, Lizard's leg, and Howlet's wing.",
	"For a charm of powerful trouble, like a hell-broth boil and bubble."
]

inputs.each do |input|
	puts input
	puts "-" * 70
	puts mangle(input)
	puts "\n\n\n"
end