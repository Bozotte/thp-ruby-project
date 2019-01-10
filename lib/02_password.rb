def signup
    puts "Quel est ton mot de passe ?"
    print "> "
    $password = gets.chomp.to_s
end

def login
    puts "Saisi ton mot de passe ?"
    print "> "
    givenPassword = gets.chomp.to_s

    while givenPassword != $password
        puts "Ce n'est pas le bon mot de passe."

        puts "Saisi ton mot de passe ?"
        print "> "
        givenPassword = gets.chomp.to_s
    end
    
    welcome_screen

end

def welcome_screen
    puts "Bienvenue dans la zone secrète!"
end

def perform
    signup
    login
end

perform