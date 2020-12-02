module OpenFilePrompt (openFilePrompt) where

import           XMonad
import           XMonad.Prompt
import           XMonad.Util.Run (unsafeSpawn, runProcessWithInput)

-- Use fzfmenu because XMonad can't handle ~50k files
openFilePrompt :: XPConfig -> X ()
openFilePrompt c =
    unsafeSpawn "xdg-open \"$(fd | fzfmenu)\""
