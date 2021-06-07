-- Much was shamelessly copied from https://github.com/splintah/xmonad-splintah/blob/master/xmonad-splintah/src/Main.hs

import qualified Data.Map                    as Map

import           XMonad
import           XMonad.Actions.CycleWS      (nextWS, prevWS)
import           XMonad.Actions.DwmPromote
import           XMonad.Hooks.EwmhDesktops   (ewmh)
import           XMonad.Hooks.ManageDocks
import           XMonad.Prompt               as Prompt
import           XMonad.Prompt.FuzzyMatch    (fuzzyMatch, fuzzySort)
import           XMonad.Prompt.Window        (WindowPrompt (Bring, Goto),
                                              allWindows, windowPrompt)
import           XMonad.StackSet             (focusDown, focusUp)
import qualified XMonad.StackSet             as W
import           XMonad.Util.NamedScratchpad (NamedScratchpad (NS),
                                              namedScratchpadAction,
                                              namedScratchpadManageHook)
import qualified XMonad.Util.NamedScratchpad as NS

-- Own modules (well, partially, MouseFollowsFocus is blatantly stolen from splintah, I guess I just want to say they're nonstandard)
import           MouseFollowsFocus           (mouseFollowsFocus)
import           MyFullscreen                (myFullscreenSupport)
import           OpenFilePrompt              (openFilePrompt)
import           TmuxPrompt                  (tmuxPrompt)

myTerminal = "st"

myFont size = "xft:DejaVu Sans Mono:size=" <> show size <> ":antialias=true:autohint=true"

-- Nord
nord0 =  "#2E3440"
nord1 =  "#3B4252"
nord2 =  "#434C5E"
nord3 =  "#4C566A"
nord4 =  "#D8DEE9"
nord5 =  "#E5E9F0"
nord6 =  "#ECEFF4"
nord7 =  "#8FBCBB"
nord8 =  "#88C0D0"
nord9 =  "#81A1C1"
nord10 =  "#5E81AC"
nord11 =  "#BF616A"
nord12 =  "#D08770"
nord13 =  "#EBCB8B"
nord14 =  "#A3BE8C"
nord15 =  "#B48EAD"

myPromptConfig = def
    { position = CenteredAt (1/8) (3/4)
    , height = 25
    , sorter = fuzzySort
    , searchPredicate = fuzzyMatch
    , alwaysHighlight = True
    , font = myFont 10
    -- Colours
    , bgColor = nord0
    , fgColor = nord10
    , bgHLight = nord0
    , fgHLight = nord8
    , borderColor = nord7
    }

myKeys conf@XConfig {XMonad.modMask = modm} = Map.fromList $ [
  ---- Applications
  -- Launch terminal
  ((modm, xK_Return), spawn myTerminal)
  -- Launch application launcher
  , ((modm, xK_space), spawn "dmenu_run")

  ---- Scratchpads
  , ((modm, xK_d), namedScratchpadAction myScratchpads "scratchpad")
  , ((modm, xK_i), namedScratchpadAction myScratchpads "todo")
  , ((modm, xK_e), namedScratchpadAction myScratchpads "astroid")

  ---- Prompts
  , ((modm, xK_t), tmuxPrompt myPromptConfig)
  , ((modm, xK_o), openFilePrompt myPromptConfig)

  ---- Window managing
  -- Kill focused window
  , ((modm, xK_w), kill)
  -- Next layout
  , ((modm .|. shiftMask, xK_space), sendMessage NextLayout)
  -- Focus next window
  , ((modm, xK_j), windows focusDown >> mouseFollowsFocus)
  -- Focus previous window
  , ((modm, xK_k), windows focusUp >> mouseFollowsFocus)
  -- Swap focused window with master
   , ((modm .|. shiftMask, xK_Return), dwmpromote)
   -- Swap focused window with below window
  , ((modm .|. shiftMask, xK_j), windows W.swapDown)
  -- Swap focused window with above window
  , ((modm .|. shiftMask, xK_k), windows W.swapUp)
  -- Floating
  , ((modm .|. shiftMask, xK_t), withFocused $ windows . W.sink)

  ---- Move between workspaces
  -- Previous workspace
  , ((modm .|. controlMask, xK_j), prevWS)
  , ((controlMask, xK_Left), prevWS)
  -- Next workspace
  , ((modm .|. controlMask, xK_k), nextWS)
  , ((controlMask, xK_Right), nextWS)
    -- Go to window
  , ((modm, xK_g), windowPrompt myPromptConfig Goto allWindows)

  ---- xmonad
  -- Restart xmonad
  , ((modm .|. shiftMask, xK_q), spawn "notify-send 'Recompiling xmonad...'; xmonad --recompile; xmonad --restart")
  ]
  <>
  [ ((modm .|. m, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1..xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]

myScratchpads = [ NS
                    { NS.name = "scratchpad"
                    , NS.cmd = "st -n scratchpad -e tmux new-session -A -s scratchpad"
                    , NS.query = resource =? "scratchpad"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.1 0.1 0.8 0.8
                    }
                , NS
                    { NS.name = "todo"
                    , NS.cmd = "st -n todo -e nvim '+au TextChanged * :wa' '+au InsertLeave * :wa' ~/Notities/todo.md"
                    , NS.query = resource =? "todo"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.2 0.1 0.6 0.8
                    }
                , NS
                    { NS.name = "astroid"
                    , NS.cmd = "astroid"
                    , NS.query = className =? ".astroid-wrapped"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.1 0.1 0.8 0.80
                    }
                ]

myLayoutHook =
    avoidStruts $ tall ||| Full
        where tall = Tall 1 (3/100) (1/2)

myStartupHook = do
    spawn "autostart_xmonad"

myManageHook =
  namedScratchpadManageHook myScratchpads <> manageDocks

main = do
    xmonad $ myFullscreenSupport $ ewmh $ docks def {
        borderWidth        = 2,
        terminal           = myTerminal,
        normalBorderColor  = nord3,
        focusedBorderColor = nord7,

        modMask = mod4Mask,
        keys = myKeys,
        layoutHook = myLayoutHook,
        manageHook = myManageHook,
        startupHook = myStartupHook
    }
