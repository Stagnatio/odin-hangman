#require 'google-10000-english-no-swears.txt'
class GAME
    words = File.readlines('google-10000-english-no-swears.txt')
    goodWords = Array.new

    words.each do |word|
        if word.length > 6 && word.length < 13
            goodWords.push word
        end
    end

    secret = goodWords[rand(goodWords.length)].downcase
    result = ""
    wrongletters = ""
    for i in 0..secret.length-2     #makes a string equal in length to secret
        result = result + "-"
    end
    result = result + "\n"

    while (secret != result)
        puts result
        puts "Wrong letters (up to 10): " + wrongletters
        puts "Guess a letter: "
        guess = gets
        correctguess = false
        puts

        # Compares each guess with each character in the secret word
        for i in 0..secret.length-1
            if secret[i] == guess[0]
                result[i] = secret[i]
                correctguess = true
            end
        end

        if correctguess == false
            wrongletters = wrongletters + guess[0]
            puts wrongletters.length
            correctguess = true
        end
        if wrongletters.length == 10
            break
        end
    end

    puts result
    if result == secret
        puts "You win!"
    elsif wrongletters.length == 10
        puts "You lose!"
        puts "The answer was: " + secret
    end
end

GAME.new