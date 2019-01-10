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
    i = 1

    puts "Combien d'étages voulez-vous ?"
    print"> "

    nb = gets.chomp.to_i
    temp_space = nb - 1
    temp_block = 1

    while i < nb
        puts (space * temp_space) + (block * temp_block)
        temp_space -= 1
        temp_block += 2
    end
end

full_pyramid