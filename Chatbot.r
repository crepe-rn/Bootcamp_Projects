# R_homework_batch6
# Chatbot for Pizza Shop

## Overall variables
menu_ID <- c(100, 101, 102, 103, 104)
menu <- c("Tropical Veggies", "Pepper Pepperoni", "Seafood Suprime", "Signature Wagyu", "Smoky Salmon")
S_price <- 399
M_price <- 459
L_price <- 549
menu_df <- data.frame(menu_ID, menu)
price_df <- data.frame(S_price, M_price, L_price)
payment_ID <- c(11, 22, 33)
payment <- c("QR Payment","Credit Card", "Mobile Banking")
payment_df <- data.frame(payment_ID, payment)

## Start
print("Welcome to TAMAGO Pizzaria (卵ピザリア)")
print("Could you please tell me your name?")
ctm_name <- as.character(readLines("stdin", n=1))
bot <- function () {
print(paste("How can I help you today,", ctm_name, "?"))
print("Would you like to order a pizza? [Y/N]")
step1 <- toupper(readLines("stdin", n=1))
if (step1 == "Y"){
  print("Here's our menu")
  print(menu_df)
  print("Which one do you like order? (Please select menu_ID)")
  menu_select <- as.numeric(readLines("stdin", n=1))
    if (menu_select == 100) {
    print(paste("Your selection: ", menu_df$menu[1]))
    piz_select <- menu_df$menu[1]
  } else if (menu_select == 101) {
    print(paste("Your selection: ", menu_df$menu[2]))
    piz_select <- menu_df$menu[2]
  } else if (menu_select == 102) {
    print(paste("Your selection: ", menu_df$menu[3]))
    piz_select <- menu_df$menu[3]
  } else if (menu_select == 103) {
    print(paste("Your selection: ", menu_df$menu[4]))
    piz_select <- menu_df$menu[4]
  } else if (menu_select == 104) {
    print(paste("Your selection: ", menu_df$menu[5]))
    piz_select <- menu_df$menu[5]
  }      
 # Size Selection 
    print("--------------------------------------------------------------------")
    print(price_df)
    print("Which size do you prefer? [S/M/L]")
 size <- toupper(readLines("stdin", n=1))
  if (size == "S") {
    print(paste("Selected size:", size, "for", price_df$S_price[1], "฿"))
    piz_price <- price_df$S_price[1]
  } else if (size == "M") {
    print(paste("Selected size:", size, "for", price_df$M_price[1], "฿"))
    piz_price <- price_df$M_price[1]
  } else if (size == "L") {
    print(paste("Selected size:", size, "for", price_df$L_price[1], "฿"))
    piz_price <- price_df$L_price[1]
  } 
# Order Quantity
  print("How many pieces do you want?")
  pieces <- as.numeric(readLines("stdin", n=1))
  qty <- pieces
  total_price <- (qty * piz_price)
  del_f <- 30 
  print(paste("--------Your Order---------"))
  print(paste("Selected menu : ", piz_select))
  print(paste("Selected size : ", size))
  print(paste("Quantity      : ", qty))
  print(paste("Delivery Fee  : ", del_f,"฿"))   
  print(paste("---------------------------"))
  print(paste("Total amount  : ", total_price+del_f,"฿"))

# Confirmation/Payment
  print("Do you confirm your order? [Y/N]")
  confirm <- toupper(readLines("stdin", n=1))
  if (confirm == "Y") {
    print("_______________________")
    print(payment_df)
    print("_______________________")
    print("How would you like to pay? (Please insert payment_ID)")
    via <- as.numeric(readLines("stdin", n=1))
    if (via == 11) {
      print("Please complete the payment within 5 minutes ")
    } else if 
      (via == 22) {
        print("Please fill out your credit card number")
        creditcard <- as.numeric(readLines("stdin", n=1))
        print(paste("Credit card No.: ", creditcard))
      } else if (via == 33) {
      print("Please USE THIS Reference NO: 213314415 to complete the payment")
      print("After completing the payment, you should take a screenshot as a proof.")
      } else { 
      print("Something went wrong! Please try again!!")
      bot()
    }
    } else {
    print("Sorry for malfunction please reorder!")
    bot()
    } 
print("Payment Successful!!!")
} else {print("Thank you! We are grateful for the pleasure of serving you.")
}
  # Delivery Info.
  print("Could you please tell me your address?")
  address <- readLines("stdin", n=1)
  print(paste("Your address: ", address))
  print("Importantly, please give us your contact number!")
  contact_no <- readLines("stdin", n=1)
  print(paste("Contact number: ", contact_no))
  print("--------------------------------------------------------------------")

  # Final (Receipt)
  Purchased <- piz_select
  receipt_df <- data.frame(Purchased, size, qty, total_price)
  print("Here is your receipt")
  print("-------------------TAMAGO Pizzaria (卵ピザリア)---------------------")
  print(paste("Name               : ", ctm_name))
  print(paste("Contact number     : ", contact_no))
  print(paste("Delivery aaddress  : ", address))
  print("--------------------------------------------------------------------")
  print(receipt_df)
  print("--------------------------------------------------------------------")
  print(paste("Total (including fee):", total_price+del_f, "฿"))
  print("--------------------------------------------------------------------")
  print("------------------- ありがとうございました。------------------------")
  print("Ps. For typical orders the time Guarantee is 40 Minutes.")
  print("--------------------------------------------------------------------")
  
print("Thank you! We are grateful for the pleasure of serving you.")
}

bot()





