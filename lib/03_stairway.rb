def gameStart
    $nb_floors = 10
    $actual_floor = 0
    puts "Bonjour, bienvenue dans le jeu des escaliers ! :)"
    puts "Tu es actuellement à l'étage #{$actual_floor}, bonne chance et bonne partie !"
    puts ""

end

def gameInit
    puts "Appuie sur ENTREE pour lancer le dé :)"
    print "> "
    gets.chomp
    $dice_result = rand(1..6).to_i
    puts ""
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
    puts "Bravo ! Tu as gagné le jeu ! "
end

def running
    gameStart
    while $actual_floor < $nb_floors
        gameInit
    end
    endGame
end

running