@shopping_list_items = ["eggs", "milk", "bread", "chicken", "beef", "cheese", "ice cream"]
@shopping_cart = []
@remove_input = ""

def menu
  puts "-- Shopping List --"
  puts " "
  print "1) View Items" "  "
  print "2) View Cart" "  "
  puts "3) Leave Store"
  @user_input = gets.chomp.to_i
end

def view_items
  if @shopping_list_items.count == 0
    puts " "    
    puts "The shelves are wiped clean!"
    puts " "    
  else
    puts " "
    puts "Available Items:"
    puts " "   
    puts @shopping_list_items.sort
    puts " " 
    puts "Add which item to cart? Type none to exit."
    
    add_items
  end
end

def not_in_stock
  puts " "      
  puts " "               
  puts "I can't seem to find #{@add_input}, let me check the back."     
  puts "..."               
  puts "Sorry, we do not have #{@add_input} in stock. Try one of these instead:"
  puts " "   

  view_items
end

def add_to_cart
  @shopping_list_items.reject!{ |x| x == @add_input}
  @shopping_cart.push @add_input
  puts " "         
  puts "Added #{@add_input} to shopping cart."
  puts " "   

  view_items
end

def add_items
  @add_input = gets.chomp
  if @add_input.to_s == "none"
  elsif @shopping_list_items.index("#{@add_input}") == nil
    not_in_stock
  elsif @shopping_list_items.index("#{@add_input}") != nil      
    add_to_cart
  else
    "You shouldn't see this"  
  end  
end

def add_to_shelf
  puts "Return which item to the shelf? Type none to exit."

  remove_items
end

def view_cart
  puts " " 
  if @shopping_cart.count == 0
    puts " "         
    puts "No items in the cart." 
  else
    puts "Your Cart:"       
    puts " "  
    puts @shopping_cart.sort
    puts " " 

    add_to_shelf
  end
end

def remove_successful
  @shopping_cart.reject!{ |x| x == @remove_input}
  @shopping_list_items.push @remove_input
  puts " "         
  puts " "     
  puts "Returned #{@remove_input} to the shelf."
  puts " "  

  view_cart
end

def remove_unsuccessful
  puts " "           
  puts "No #{@remove_input} in the cart."     
  puts " "   

  view_cart  
end

def remove_items
  @remove_input = gets.chomp
  if @remove_input.length == 0
    remove_items
  elsif @remove_input == "none"      
  elsif @shopping_cart.index("#{@remove_input}") == nil
    remove_unsuccessful
  elsif @shopping_cart.index("#{@remove_input}") != nil 
    remove_successful
  else
    "You shouldn't see this"  
  end
end

while true
  puts " "
  menu
  case @user_input
    when 1
      view_items
    when 2
      view_cart
    when 3
      exit(0)
    else
  end
end