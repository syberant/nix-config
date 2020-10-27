-- Much was shamelessly copied from https://github.com/splintah/xmonad-splintah/blob/master/xmonad-splintah/src/Main.hs

import           System.IO
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Util.EZConfig        (additionalKeys)
import           XMonad.Util.Run             (spawnPipe)

import qualified Data.Map                    as Map
import           XMonad.Actions.CycleWS      (nextWS, prevWS)
import           XMonad.Hooks.ManageDocks
import           XMonad.StackSet             (focusDown, focusUp)
import qualified XMonad.StackSet             as W
import           XMonad.Util.NamedScratchpad (NamedScratchpad (NS),
                                              namedScratchpadAction,
                                              namedScratchpadManageHook)
import qualified XMonad.Util.NamedScratchpad as NS

-- Own modules (well, for now just shamelessly ripped from splintah's config)
import           MouseFollowsFocus           (mouseFollowsFocus)

myTerminal = "st"

myKeys conf@XConfig {XMonad.modMask = modm} = Map.fromList [
  ---- Applications
  -- Launch terminal
  ((modm, xK_Return), spawn myTerminal)
  -- Launch application launcher
  , ((modm, xK_space), spawn "dmenu_run")

  ---- Scratchpads
  -- Dropdown terminal
  , ((modm, xK_d), namedScratchpadAction myScratchpads "scratchpad")
  , ((modm, xK_i), namedScratchpadAction myScratchpads "todo")

  ---- xmonad
  -- Kill focused window
  , ((modm, xK_w), kill)
  -- Next layout
  , ((modm .|. shiftMask, xK_space), sendMessage NextLayout)
  -- Focus next window
  , ((modm, xK_j), windows focusDown >> mouseFollowsFocus)
  -- Focus previous window
  , ((modm, xK_k), windows focusUp >> mouseFollowsFocus)
  -- Swap focused window with master
   , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
   -- Swap focused window with below window
  , ((modm .|. shiftMask, xK_j), windows W.swapDown)
  -- Swap focused window with above window
  , ((modm .|. shiftMask, xK_k), windows W.swapUp)
  -- Previous workspace
  , ((modm .|. controlMask, xK_j), prevWS)
  , ((controlMask, xK_Left), prevWS)
  -- Next workspace
  , ((modm .|. controlMask, xK_k), nextWS)
  , ((controlMask, xK_Right), nextWS)
  -- Restart xmonad
  , ((modm .|. shiftMask, xK_q), spawn "notify-send 'Recompiling xmonad...'; xmonad --recompile; xmonad --restart")
  ]

myScratchpads = [ NS
                    { NS.name = "scratchpad"
                    , NS.cmd = "st -n scratchpad -e tmux new-session -A -t scratchpad"
                    , NS.query = resource =? "scratchpad"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.1 0.1 0.8 0.8
                    }
                , NS
                    { NS.name = "todo"
                    , NS.cmd = "st -n todo -e nvim ~/Notities/todo.md"
                    , NS.query = resource =? "todo"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.2 0.1 0.6 0.8
                    }
                ]

myLayoutHook =
    avoidStruts tall
        where tall = Tall 1 (3/100) (1/2)

myStartupHook = do
    spawn "autostart_xmonad"

myManageHook =
  namedScratchpadManageHook myScratchpads <> manageDocks

main = do
    xmonad $ docks def {
        borderWidth        = 2,
        terminal           = myTerminal,
        normalBorderColor  = "#000000",
        focusedBorderColor = "#d3f5f5",

        modMask = mod4Mask,
        keys = myKeys,
        layoutHook = myLayoutHook,
        manageHook = myManageHook,
        startupHook = myStartupHook
    }
