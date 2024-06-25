module MouseFollowsFocus (mouseFollowsFocus) where

import XMonad
import Foreign.C.Types (CInt (..))

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
