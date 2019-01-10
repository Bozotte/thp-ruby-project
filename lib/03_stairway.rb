def gameInit # Initialisation des paramètres d'une partie
    $nb_floors = 10 # Variable qui contient l'étage à atteindre pour terminer une partie
    $actual_floor = 0 # Variable qui contient l'étage actuel et qui démarre à 0
    $nb_laps = 0 # Variable qui va stocker le nombre de tours réalisés dans une partie pour atteindre l'étage 10
end

def initArray # Fonction qui initialise l'array contenant le nombre de tours réalisé pour finir chaque partie
    $array_laps= []
end

def gameStart # Lancement du dé et envoi dans les différents cas possibles
    $dice_result = rand(1..6).to_i # Variable qui choisit un nombre au hasard entre 1 et 6
    gameCase
end

def gameCase # Les différents cas possibles selon le résultat du dé
    case $dice_result
    when 1
        goDown
    when 2, 3, 4
        stay
    when 5,6
        goUp
    end
end

def goDown # Méthode qui diminue l'étage actuel de 1
    $actual_floor -= 1 
end

def goUp # Méthode qui augmente l'étage actuel de 2
    $actual_floor += 1
end

def stay # Rien ne se passe pour les résultats 2, 3 et 4. (Fonction utilisée lorsque nous faisions le fonctionnement manuel)
end

def endGame # Fonction qui sauvegarde le nombre de tours pour finir une partie dans un array
    $array_laps << $nb_laps
end

def average_laps # Fonction qui permet de trouver le nombre de tours moyen pour un certain nombre de partie jouées

    # Variable qui stocke le résultat de la somme des tours de chaque partie, divisé par le nombre total de parties jouées
    average = $array_laps.reduce(:+)/$array_laps.count
    return average.to_s
end

def nb_games # Fonction qui récupère un nombre de partie à lancer fournis par l'utilisateur
    puts "Bonjour, veuillez entrer un chiffre supérieur ou égal à 100 :)"
    print"> "
    $given_nb_games = gets.chomp.to_i
    return $given_nb_games
end


def average_finish_time # Fonction principal qui éxécute un ensemble d'instruction pour trouver le nombre de tour moyen selon un nombre de partie donnée

    initArray # Initialisation de l'array contenant le nombre de tours total de chaque partie
    nb_games.times do # Méthode exécutée sur la fonction nb_games qui retourne un entier. (Pour automatiser la fonction globale, remplacez par un chiffre. exemple 100)

        gameInit # Intialisation des paramètres d'une nouvelle partie
        while $actual_floor < $nb_floors # Boucle while qui va s'exécuter tant que l'étage 10 n'est pas atteint
            gameStart # Je démarre ma partie avec le dé
            $nb_laps += 1 # J'incrémente mes tours. Le compteur s'arrêtera une fois que l'étage actuel sera égale à 10
        end
        endGame # Fin du jeu. (Voir fonction endGame plus haut)
    end

    # Je calcule ma moyenne et je l'affiche
    puts "Le nombre de tours moyen réalisé pour atteindre l'étage #{$nb_floors} en #{$given_nb_games} parties est de #{average_laps} tours." 

end

average_finish_time