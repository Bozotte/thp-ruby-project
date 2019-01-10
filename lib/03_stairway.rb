def gameStart
    $nb_floors = 10
    $actual_floor = 0
    puts "Bonjour, bienvenue dans le jeu des escaliers ! :)"
    puts "Tu es actuellement à l'étage #{$actual_floor}, bonne chance et bonne partie !"

end

def gameInit
    puts "Entre un chiffre ! :)"
    print "> "

    $dice_result = gets.chomp.to_i
    puts $dice_result
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
        puts "try again"
    end
end

def goDown
    $actual_floor -= 1 
    puts "Tu as fait #{$dice_result}, tu descends d'une marche ! Dommage !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
end

def goUp
    $actual_floor += 1
    puts "Tu as fait #{$dice_result}, tu avances d'une marche !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
end

def stay
    puts "Tu as fait #{$dice_result}, tu ne bouges pas d'un pouce ! Dommage !"
    puts "Tu es maintenant à la marche #{$actual_floor}"
end

def running
    gameStart
    gameInit
    i = 0 
    while i >= $actual_floor
        gameCase
        i+=1
    end
end

running