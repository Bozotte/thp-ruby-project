def half_pyramid
    block = "#"
    space = " "
    i = 1

    puts "Combien d'étages voulez-vous ?"
    print"> "

    nb = gets.chomp.to_i
    temp_space = nb - 1
    temp_block = 1

    while i < nb
        puts (space * temp_space) + (block * temp_block)
        temp_space -= 1
        temp_block += 1
    end
end

def full_pyramid
    block = "#"
    space = " "
    i = 0

    puts "Combien d'étages voulez-vous ?"
    print"> "

    nb = gets.chomp.to_i
    temp_space = nb - 1
    temp_block = 1

    while i < nb
        puts (space * temp_space) + (block * temp_block)
        temp_space -= 1
        temp_block += 2
        i+=1
    end
end

def reverse_pyramid
    block = "#"
    space = " "
    i = 0

    puts "Combien d'étages voulez-vous ?"
    print"> "

    nb = gets.chomp.to_i
    temp_space = 0
    temp_block = (nb * 2) - 1

    while i < nb
    puts (space * temp_space) + (block * temp_block) 
    temp_block -= 2
    temp_space += 1
    i += 1
    end
end

def diamond_full_pyramid(givenNumber)
    block = "#"
    space = " "
    i = 0

    nb = (givenNumber + 1)/2
    temp_space = nb - 1
    temp_block = 1

    while i < nb
        puts (space * temp_space) + (block * temp_block)
        temp_space -= 1
        temp_block += 2
        i+=1
    end
end

def diamond_reverse_pyramid(givenNumber)
    block = "#"
    space = " "
    i = 0

    nb = (givenNumber - 1)/2
    temp_space = 1
    temp_block = (nb * 2) - 1

    while i < nb
    puts (space * temp_space) + (block * temp_block) 
    temp_block -= 2
    temp_space += 1
    i += 1
    end
end

def wtf_pyramid
    puts "Combien d'étages voulez-vous ?"
    print"> "

    nb = gets.chomp.to_i

    if nb%2!=0
        diamond_full_pyramid(nb)
        diamond_reverse_pyramid(nb)
    else 
        puts "Désolé, ton nombre est pair"
    end

end 

wtf_pyramid