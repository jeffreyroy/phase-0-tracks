# Method to create a list
# create_list(items_string)
# parameter: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # split items_string into items_array using spaces as divider
  # create empty hash items_hash
  # loop through string s in items_array
  	# add item to items_hash using s as key and 1 as quantity
  # print the list to the console [can you use one of your other methods here?]
  # print_list(items_hash)
# output: hash

# Method to add an item to a list
# add_item(items_list, item, quantity = 1)
# parameter: hash of items, item name (string) and optional quantity (integer)
# steps:
  # add new item to hash using string as key and quantity as value
# output:  updated hash

# Method to remove an item from the list
# remove_item(items_list, item)
# input: hash of items, item name (string)
# steps:
  # IF key exists in hash
  	# delete item using key
  # END IF
# output: new hash

# Method to update the quantity of an item
# update_quantity(items_list, item, quantity)
# input:  hash of items, item (string), quantity (integer)
# steps:
  # IF key exists in hash
    # set new quantity using string as key
  # END IF
# output: new hash

# Method to print a list and make it look pretty
# print_list(items_hash)
# input:  hash of items
# steps:
  # loop through keys in hash
  	# print "I need (value) of (key)"
# output: nil