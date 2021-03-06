
class GAME
    words = File.readlines('google-10000-english-no-swears.txt')
    goodWords = Array.new

    words.each do |word|
        if word.length > 6 && word.length < 13
            goodWords.push word
        end
    end

    secret = goodWords[rand(goodWords.length)].chomp.downcase
    result = ""
    wrongletters = ""
    for i in 0..secret.length-1     #makes a string equal in length to secret
        result = result + "-"
    end
    result = result

    puts "Would you like to load a previous game? (y/n)"
    choice = gets.chomp.downcase
    if choice == "y"
        puts "Name of save file?"
        id = gets
        File.open("savegames/#{id}.txt", 'r') do |file|
            secret = file.readline
            result = file.readline
            wrongletters = file.readline
        end
    end

    while (secret != result)
        puts result
        puts "Wrong letters (up to 10): " + wrongletters

        puts "Guess a letter, or # to save: "
        choice = gets.chomp
        if choice == "#"
            Dir.mkdir('savegames') unless Dir.exist?('savegames')
            puts "Name for save file?"
            id = gets
            File.open("savegames/#{id}.txt", 'w') do |file|
                file.puts secret
                file.puts result
                file.puts wrongletters
            end
            exit
        end
        guess = choice.downcase
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