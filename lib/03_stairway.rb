def gameStart
    $nb_floors = 10
    $actual_floor = 0
    $nb_laps = 0
    puts "Bonjour, bienvenue dans le jeu des escaliers ! :)"
    puts "Tu es actuellement à l'étage #{$actual_floor}, bonne chance et bonne partie !"
    puts ""
    puts "Appuie sur ENTREE pour lancer le jeu :)"
    print "> "
    gets.chomp
end

def gameInit
    $dice_result = rand(1..6).to_i
    gameCase
end

def gameCase
    case $dice_result
    when 1
        goDown
    when 2, 3, 4
        stay
    when 5,6
        goUp
    else 
        puts "Désolé, ce nombre n'est pas valide."
        puts ""
    end
end

def goDown
    $actual_floor -= 1 
    puts "Tu as fait #{$dice_result}, tu descends d'une marche ! Dommage !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
    puts""
end

def goUp
    $actual_floor += 1
    puts "Tu as fait #{$dice_result}, tu avances d'une marche !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
    puts ""
end

def stay
    puts "Tu as fait #{$dice_result}, tu ne bouges pas d'un pouce ! Dommage !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
    puts ""
end

def endGame
    puts "Le nombre de tours est de : #{$nb_laps}"
    puts "Bravo ! Tu as gagné le jeu ! "
    average_finish_time
end

def nbGames
    puts "Combien de partie voulez-vous simuler ?"
    print "> "
    nb_games = gets.chomp.to_i
    return nb_games

end

def average_finish_time
    $array_laps.push($nb_laps)
end

def initArray
    $array_laps= []
end

def average_laps
    sum = 0
    $array_laps.each do |i|
        sum = sum + i 
    end
    average = sum / $array_laps.count
    puts average.to_f
    return average
end

def running
    initArray
    nbGames.times do 
        gameStart
        while $actual_floor < $nb_floors
            gameInit
            $nb_laps += 1
        end
        endGame
    end
end

running

