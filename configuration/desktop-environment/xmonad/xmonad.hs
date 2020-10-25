-- Much was shamelessly copied from https://github.com/splintah/xmonad-splintah/blob/master/xmonad-splintah/src/Main.hs

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import qualified Data.Map as Map
import XMonad.StackSet (focusDown, focusUp)
import XMonad.Actions.CycleWS (nextWS, prevWS)
import Foreign.C.Types (CInt (..))

myTerminal = "st"

-- | Move the mouse pointer to the centre of the window.
mouseToWindowCentre :: Display -> Window -> X ()
mouseToWindowCentre display window = liftIO $ do
  WindowAttributes {wa_width = width, wa_height = height} <-
    getWindowAttributes display window
  -- 'warpPointer' moves the mouse pointer relative to the origin of the
  -- destination window (the third argument, here 'window'). The x and y
  -- coordinates of the focused window are thus not needed to move the mouse
  -- pointer to the centre of the window.
  let CInt x = width  `div` 2
  let CInt y = height `div` 2
  warpPointer display 0 window 0 0 0 0 x y

-- | Move the mouse pointer to the centre of the focused window.
mouseFollowsFocus :: X ()
mouseFollowsFocus =
  withFocused $ \window ->
  withDisplay $ \display ->
  mouseToWindowCentre display window

myKeys conf@XConfig {XMonad.modMask = modm} = Map.fromList [
  ---- Applications
  -- Launch terminal
  ((modm, xK_Return), spawn myTerminal)
  -- Launch application launcher
  , ((modm, xK_space), spawn "dmenu_run")

  ---- xmonad
  -- Kill focused window
  , ((modm, xK_w), kill)
  -- Next layout
  , ((modm .|. shiftMask, xK_space), sendMessage NextLayout)
  -- Focus next window
  , ((modm, xK_j), windows focusDown >> mouseFollowsFocus)
  -- Focus previous window
  , ((modm, xK_k), windows focusUp >> mouseFollowsFocus)
  -- Previous workspace
  , ((modm .|. controlMask, xK_j), prevWS)
  -- Next workspace
  , ((modm .|. controlMask, xK_k), nextWS)
  -- Restart xmonad
  , ((modm .|. shiftMask, xK_q), spawn "notify-send 'Recompiling xmonad...'; xmonad --recompile; xmonad --restart")
  ]

main = do
    xmonad $ def {
        borderWidth        = 2,
        terminal           = myTerminal,
        normalBorderColor  = "#000000",
        focusedBorderColor = "#d3f5f5",

        modMask = mod4Mask,
        keys = myKeys,
        focusFollowsMouse = True
    }
