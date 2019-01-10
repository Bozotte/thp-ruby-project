def gameStart
    $nb_floors = 10
    $actual_floor = 0
    $nb_laps = 0
    puts "Appuie sur ENTREE pour lancer le jeu :)"
    print "> "
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
end

def goUp
    $actual_floor += 1
end

def stay
end

def endGame
    average_finish_time
end

def nbGames
    nb_games = 100
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
puts $array_laps
average_laps
