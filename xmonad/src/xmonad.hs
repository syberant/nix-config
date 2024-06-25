-- Much was shamelessly copied from https://github.com/splintah/xmonad-splintah/blob/master/xmonad-splintah/src/Main.hs

import qualified Data.Map                         as Map
import           System.Environment               (lookupEnv)
import           System.IO.Unsafe                 (unsafePerformIO)

import           XMonad
import           XMonad.Actions.CycleWS           (Direction1D (Next, Prev),
                                                   ignoringWSs, moveTo)
import           XMonad.Actions.DwmPromote
import           XMonad.Actions.DynamicWorkspaces (addWorkspace, removeWorkspace)
import           XMonad.Actions.GridSelect
import           XMonad.Hooks.EwmhDesktops        (addEwmhWorkspaceSort, ewmh,
                                                   ewmhFullscreen)
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.StatusBar
import           XMonad.Layout.Decoration
import           XMonad.Layout.NoFrillsDecoration (noFrillsDeco)
-- import           XMonad.Layout.Spacing            (spacingRaw, Border)
import           XMonad.Layout.Spacing
import           XMonad.Prompt                    as Prompt
import           XMonad.Prompt.FuzzyMatch         (fuzzyMatch, fuzzySort)
import           XMonad.Prompt.Pass
import           XMonad.Prompt.Window             (WindowPrompt (Bring, Goto),
                                                   allWindows, windowPrompt)
import qualified XMonad.StackSet                  as W
import           XMonad.StackSet                  (focusDown, focusUp)
import qualified XMonad.Util.NamedScratchpad      as NS
import           XMonad.Util.NamedScratchpad      (NamedScratchpad (NS),
                                                   namedScratchpadAction,
                                                   namedScratchpadManageHook,
                                                   scratchpadWorkspaceTag)
import           XMonad.Util.WorkspaceCompare     (filterOutWs)

-- Own modules (well, partially, MouseFollowsFocus is blatantly stolen from splintah, I guess I just want to say they're nonstandard)
import           Hide                             (hiddenWorkspaces,
                                                   withNthFilteredWorkspace)
import           MouseFollowsFocus                (mouseFollowsFocus)
import           OpenFilePrompt                   (openFilePrompt)
import qualified Projects                         as P
import           SideDecorations
import           Terminal                         (Terminal (..), baseTerminal,
                                                   executeCommand,
                                                   executeCommandWithWindowClass)
import           TmuxPrompt                       (tmuxPrompt)

myTerminal :: Terminal
myTerminal = Alacritty

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
  ((modm, xK_Return), spawn $ baseTerminal myTerminal)
  -- Launch application launcher
  , ((modm, xK_space), spawn "dmenu_run")

  ---- Scratchpads
  , ((modm, xK_d), namedScratchpadAction myScratchpads "scratchpad")
  , ((modm, xK_i), namedScratchpadAction myScratchpads "roam" >> namedScratchpadAction myScratchpads "todo")
  , ((modm, xK_e), namedScratchpadAction myScratchpads "mail")

  ---- Prompts
  , ((modm, xK_t), tmuxPrompt myPromptConfig)
  , ((modm, xK_o), openFilePrompt myPromptConfig)
  , ((modm, xK_p), passPrompt myPromptConfig)
  , ((modm, xK_g), goToSelected def)

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
  , ((modm .|. controlMask, xK_j), moveSkipping Prev)
  , ((controlMask, xK_Left), moveSkipping Prev)
  -- Next workspace
  , ((modm .|. controlMask, xK_k), moveSkipping Next)
  , ((controlMask, xK_Right), moveSkipping Next)
    -- Go to window
  , ((modm, xK_g), windowPrompt myPromptConfig Goto allWindows)

  ---- Project management
  , ((modm, xK_a), P.switchProject def)
  , ((modm, xK_r), P.removeCurrentProject)
  , ((modm .|. shiftMask, xK_a), addWorkspace def)
  , ((modm .|. shiftMask, xK_r), removeWorkspace)

  ---- xmonad
  -- Restart xmonad
  , ((modm .|. shiftMask, xK_q), spawn $ "notify-send 'Recompiling xmonad...'; xmonad --recompile && xmonad --restart && notify-send 'Compilation succeeded' || (notify-send -u critical 'Compilation failed'; " ++ executeCommand myTerminal "less ~/.xmonad/xmonad.errors" ++ ")")
  ]
  <>
  -- mod-[1..9]       %! Switch to workspace N
  -- mod-shift-[1..9] %! Move window to workspace N
  [ ((modm .|. m, k), withNthFilteredWorkspace f i)
  | (i, k) <- zip [0..] [xK_1..xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]
  where
    -- Move to next workspace in direction `d` while skipping over the NSP scratchpad workspace
    moveSkipping d = hiddenWorkspaces >>= moveTo d . ignoringWSs

myScratchpads = [ NS
                    { NS.name = "scratchpad"
                    , NS.cmd = executeCommandWithWindowClass myTerminal "scratchpad" "tmux new-session -A -s scratchpad"
                    , NS.query = resource =? "scratchpad"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.1 0.1 0.8 0.8
                    }
                , NS
                    { NS.name = "todo"
                    , NS.cmd = "emacs -T notes"
                    , NS.query = title =? "notes"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.5 0.03 0.5 1
                    }
                , NS
                    { NS.name = "roam"
                    , NS.cmd = "env WEBKIT_DISABLE_COMPOSITING_MODE=1 surf -N localhost:35901"
                    , NS.query = resource =? "surf" -- TODO: hack `surf` so I can set WM_CLASS via CLI
                    , NS.hook = NS.customFloating $ W.RationalRect 0 0.03 0.5 1
                    }
                , NS
                    { NS.name = "mail"
                    , NS.cmd = "thunderbird"
                    , NS.query = resource =? "Mail"
                    , NS.hook = NS.customFloating $ W.RationalRect 0.1 0.1 0.8 0.80
                    }
                ]

topBarTheme = def
    { decoHeight          = 5
    , decoWidth           = 8
    , inactiveBorderColor = inactive
    , inactiveColor       = inactive
    , inactiveTextColor   = inactive
    , activeBorderColor   = active
    , activeColor         = active
    , activeTextColor     = active
    }
    where
        inactive = nord3
        active = nord7

myDecorate = decoration shrinkText topBarTheme (SideDecoration L)

myLayoutHook =
    avoidStruts $ (myDecorate $ addGaps $ tall) ||| Full
        where
            tall = Tall 1 (3/100) (1/2)
            addGaps = spacingRaw True (Border 0 0 0 0) False (Border 3 3 3 3) True

myStartupHook = do
    -- When reloading kill the previous status bar(s)
    killAllStatusBars

    -- Launch the status bar(s) again
    let statusbarCommand = unsafePerformIO $ do lookupEnv "XMONAD_SYBRAND_STATUSBAR"
    case statusbarCommand of
        Nothing -> spawn "notify-send 'warning: XMONAD_SYBRAND_STATUSBAR does not exist, status bar not loaded'"
        Just cmd -> spawnStatusBar cmd

myManageHook =
  namedScratchpadManageHook myScratchpads <> manageDocks

main = do
    xmonad . addEwmhWorkspaceSort (filterOutWs <$> hiddenWorkspaces) . ewmhFullscreen . ewmh . docks $ def {
        borderWidth        = 0,
        terminal           = baseTerminal myTerminal,
        normalBorderColor  = nord3,
        focusedBorderColor = nord7,

        modMask = mod4Mask,
        keys = myKeys,
        layoutHook = myLayoutHook,
        manageHook = myManageHook,
        startupHook = myStartupHook
    }
