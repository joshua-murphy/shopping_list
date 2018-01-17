@list = ["eggs", "milk", "bread", "chicken", "beef", "cheese", "ice cream"]
@cart = []

def menu
  puts "\n    ====--- Shopping List ---===="
  print "1) View Items  2) View Cart  3) Leave Store\n"
  case gets.strip.to_i
    when 1
      view_items
    when 2
      view_cart
    when 3
      exit(0)
    else
      puts "Invalid input."
      menu
  end
end

def view_items
  if @list.count == 0
    puts "\nThe shelves are wiped clean!"
  else
    puts "\nAvailable Items:"
    puts @list.sort
    add_items
  end
end

def add_items
  puts "\nAdd which item to cart? Type 'done' to exit."  
  add_input = gets.strip.downcase
  add_input == "done" ? menu : add_check(@list.index("#{add_input}"))
end

def add_check(index)
  if index
    item = @list[index]
    @list.delete(item)
    @cart.push(item)
    puts "\nAdded #{item} to shopping cart.\n "
  else
    puts "\nI can't seem to find #{input}, let me check the back."     
    puts "Sorry, we do not have #{input} in stock.\n "
  end
  view_items
end

def view_cart
  if @cart.count == 0
    puts "\nNo items in the cart."
  else
    puts "\nYour Cart:"
    puts @cart.sort
    remove_items
  end
end

def remove_items
  puts "\nReturn which item to the shelf? Type 'done' to exit."
  remove_input = gets.strip.downcase
  remove_input == "done" ? menu : remove_check(@cart.index("#{remove_input}"))
end

def remove_check(index)
  if index
    item = @cart[index]
    @cart.delete(item)
    @list.push(item)
    puts "\nReturned #{item} to the shelf."
  else
    puts "\nYou don't have that in the cart."
  end
  view_cart
end

while true
  menu
end