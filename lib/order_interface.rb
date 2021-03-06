class OrderInterface

  attr_reader :order_manager

  def initialize
    @order_manager = OrderManager.new
  end

  def interactive_menu
    loop do
      print_options 
      process(STDIN.gets.chomp) 
    end
  end

  def print_options
    puts '1. View the menu'
    puts '2. Order a dish'
    puts '3. View your order'
    puts '4. Delete an item from your order'
    puts '5. Delete your entire order'
    puts '6. Confirm your order'
    puts '9. Exit'
  end

  def process(selection)
    case selection
    when '1' then order_manager.menu_manager.display_menu
    when '2' then capture_order
    when '3' then order_manager.view_order
    when '4' then delete_an_item_from_order
    when '5' then order_manager.delete_entire_order
    when '6' then order_manager.confirm_order
    when '9' then exit
    else puts 'Sorry that option doesn\'t exist, please try again'
    end
  end
  
  def capture_order
    order_manager.menu_manager.display_menu
    puts 'What dish would you like?'
    dish = STDIN.gets.chomp
    puts "How many #{dish} would you like?"
    quantity = STDIN.gets.chomp.to_i
    puts 'How much is that?'
    cost = STDIN.gets.chomp.to_f
    order_manager.add_item_to_order(dish, quantity, cost)
  end

  def delete_an_item_from_order
    order_manager.view_order
    puts 'Which line item would you like to delete?'
    order_manager.delete_item(STDIN.gets.chomp.to_i - 1)
  end

end
