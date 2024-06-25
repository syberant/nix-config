module Terminal (Terminal(Alacritty, St), baseTerminal, withWindowClass, executeCommand, executeCommandWithWindowClass) where

data Terminal = Alacritty | St

baseTerminal :: Terminal -> String
baseTerminal Alacritty = "alacritty "
baseTerminal St = "st "

withWindowClass :: Terminal -> String -> String
withWindowClass Alacritty name = "alacritty --class '" ++ name ++ "' "
withWindowClass St name = "st -n '" ++ name ++ "' "

executeCommand :: Terminal -> String -> String
executeCommand t cmd = baseTerminal t ++ " -e " ++ cmd

executeCommandWithWindowClass :: Terminal -> String -> String -> String
executeCommandWithWindowClass t name cmd = withWindowClass t name ++ " -e " ++ cmd
