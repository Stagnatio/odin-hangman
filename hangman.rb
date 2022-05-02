#require 'google-10000-english-no-swears.txt'
class GAME
    words = File.readlines('google-10000-english-no-swears.txt')
    goodWords = Array.new

    words.each do |word|
        if word.length > 5 && word.length < 12
            goodWords.push word
        end
    end

    secret = goodWords[rand(goodWords.length)]
    puts secret
    guesses = ""
    result = ""
    for i in 0..secret.length-1     #makes a string equal in length to secret
        result = result + "_"
    end
    while (secret != result)
        puts result
        puts "Guess a letter: "
        guesses = guesses + gets

        for i in 0..secret.length-1
            for j in 0..guesses.length-1
                if secret[i] == guesses[j]
                    result[i] = secret[i]
                    break
                end
            end
        end
    end

    puts result
    if result = secret
        puts "You win!"
    end
end

GAME.new