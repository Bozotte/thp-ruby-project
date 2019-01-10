def gameInit #Initialisation des paramètres du jeu
    $nb_floors = 10
    $actual_floor = 0
    $nb_laps = 0
end

def initArray #méthode qui initialise l'array qui va contenir le nombre de tours de chaque jeu
    $array_laps= []
end

def gameStart #Lancement du dé et envoi dans les différents cas possibles
    $dice_result = rand(1..6).to_i
    gameCase
end

def gameCase #les différents cas possibles selon les résultats du dé
    case $dice_result
    when 1
        goDown
    when 2, 3, 4
        stay
    when 5,6
        goUp
    end
end

def goDown #méthode qui diminue l'étage de 1
    $actual_floor -= 1 
end

def goUp #méthode qui augmente l'étage de 2
    $actual_floor += 1
end

def stay #rien ne se passe, utilisée lorsque nous faisions le fonctionnement manuel
end

def endGame #méthode qui sauvegarde le nombre de tours du jeu dans un tableau à la fin du jeu
    $array_laps.push($nb_laps)
end

def average_laps #méthode qui calcule le nombre de tours moyen pour les différentes parties
    sum = 0
    $array_laps.each do |i|
        sum = sum + i 
    end
    average = sum / $array_laps.count
    return average.to_s
end

def nb_games
    puts "Bonjour, veuillez entrer un chiffre supérieur ou égal à 100 :)"
    print"> "
    given_nb_games = gets.chomp.to_i
    return given_nb_games
end


def average_finish_time #méthode qui lance la requête concernant les 100 parties
    initArray #initialisation du tableau contenant le nombre de tours
    nb_games.times do #demande le nombre de lancers puis lance l'exécution x fois selon le nombre donné, pour automatiser totalement, changer le nb_games en 100 ou nombre voulu
        gameInit #intialisation d'un nouveau jeu
        while $actual_floor < $nb_floors #tant que l'étage 10 n'est pas atteint
            gameStart #je démarre mon jeu
            $nb_laps += 1 #je compte mes tours
        end
        endGame #fin du jeu et entrée de la valeur
    end
    puts "Le nombre de tours moyens pour parties est de : " + average_laps #je calcule ma moyenne et l'affiche
end

average_finish_time
