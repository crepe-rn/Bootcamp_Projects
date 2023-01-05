JKN <- function() {
  #variables
  w_count <- 0
  l_count <- 0
  d_count <- 0
  r_count <- 0
  
  # Greeting first
  print("―――――――――――――　JANKEN　GAME じゃんけんようこそ！―――――――――――――")
  print("What is your name, our talented player?")
  ply_name <- readLines("stdin", n=1)
  print(paste("WE ARE GLAD YOU WERE HERE!: ", ply_name))
  print("Are you ready to begin? [Y/N]")
  ply_consent <- toupper(readLines("stdin", n=1))
  if (ply_consent == "Y") {
    ## Instruction
      print(">>>>>>>>>>>>>> Let's begin!!! <<<<<<<<<<<<<<<")
      print("We would like to give you a instruction before playing.")
      print("***Please read carefully")
      print("-----------------------------------------------------")
      print("Please INPUT those following characters as your pick")
      print("'R' for Rock | 'P' for Paper | 'S' for Scissors")
      print("-----------------------------------------------------")
      print("'Q' for Quit Game")
    # Begin!
    r_count <- r_count + 1 
    print(paste("Are you ready to hit the bot? [Y/N]"))
      game_cf <- toupper(readLines("stdin", n=1))
      while ((game_cf == "Y")) {
        bot_opts <- c("R", "P", "S")
        names(bot_opts) <- c("Rock", "Paper", "Scissors")
        print("Please pick your weapon!! [R/P/S]")
        ply_pick <- toupper(readLines("stdin", n=1))
        bot_pick <- sample(bot_opts, 1)  
          # Draw case                  
          if (toupper(ply_pick) == bot_pick) {
            print(paste("Bot: ", names(bot_pick)))
            print(paste("Yours: ", ply_pick))
            print("YOU DRAW!")
            d_count <- d_count + 1
            r_count <- r_count + 1
          } # Win case
            else if ((toupper(ply_pick) == "R" & bot_pick == "S") ||
                     (toupper(ply_pick) == "P" & bot_pick == "R") ||
                     (toupper(ply_pick) == "S" & bot_pick == "P")) {
            print(paste("Bot: ", names(bot_pick)))
            print(paste("Yours: ", ply_pick))
            print("YOU WIN!")
            w_count <- w_count + 1
            r_count <- r_count + 1
            } # Lose case
            else if ((toupper(ply_pick) == "R" & bot_pick == "P") ||
                     (toupper(ply_pick) == "P" & bot_pick == "S") ||
                     (toupper(ply_pick) == "S" & bot_pick == "R")) {
            print(paste("Bot: ", names(bot_pick)))
            print(paste("Yours: ", ply_pick))
            print("YOU LOSE!")
            l_count <- l_count + 1
            r_count <- r_count + 1 
            } # Quit Game
            else if (toupper(ply_pick) == "Q") {
              print("Quit Game!")
              break
            } else {
        print("ERROR!! Please try again!")                  
      }  
      } ## Overview
       print(paste("--------TOTAL SCORE-------"))
       print(paste("Player   : ", ply_name))
       print(paste("Round(s) : ", r_count))
       print(paste("Win      : ", w_count))
       print(paste("Lose     : ", l_count))
       print(paste("Draw     : ", d_count))
       print(paste("--------------------------"))
       print(paste("--------WELL DONE!--------"))
  } 
  print("Thank you for playing with us! Have a great day!!")
  print("ありがとうございました。またね！")
}

JKN()