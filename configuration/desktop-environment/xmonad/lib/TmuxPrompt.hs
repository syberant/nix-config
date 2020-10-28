module TmuxPrompt (tmuxPrompt) where

import           System.IO       (hClose, hGetContents)
import           System.Process  (StdStream (CreatePipe), createProcess, proc,
                                  std_out)
import           XMonad
import           XMonad.Prompt
import           XMonad.Util.Run (runInTerm, runProcessWithInput)

data Tmux = Tmux

instance XPrompt Tmux where
    showXPrompt Tmux = "Tmux session: "

tmuxPrompt :: XPConfig -> X ()
tmuxPrompt c = do
    sessions <- getSessions
    mkXPrompt Tmux c (mkComplFunFromList' sessions) startTmux

getSessions :: MonadIO m => m [String]
getSessions = io $ do
    (_, Just pout, _, _) <- createProcess (proc "tmux" ["ls", "-F", "#{session_name}"]) {std_out = CreatePipe }
    strings <- hGetContents pout
    return $ lines strings

startTmux :: String -> X ()
startTmux s = runInTerm "" $ "tmux new-session -A -s \"" ++ s ++ "\""
