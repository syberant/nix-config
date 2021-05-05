module MyFullscreen (myFullscreenSupport) where

import           XMonad
import           XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import           XMonad.Hooks.SetWMName    (setWMName)
-- TODO: figure out how this helps fullscreen (currently unused)
import           XMonad.Layout.Fullscreen  (fullscreenSupport)

-- From: https://github.com/mpv-player/mpv/issues/888#issuecomment-53065149
setSupportedWithFullscreen :: X ()
setSupportedWithFullscreen = withDisplay $ \dpy -> do
    r <- asks theRoot
    a <- getAtom "_NET_SUPPORTED"
    c <- getAtom "ATOM"
    supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                         ,"_NET_WM_STATE_FULLSCREEN"
                         ,"_NET_NUMBER_OF_DESKTOPS"
                         ,"_NET_CLIENT_LIST"
                         ,"_NET_CLIENT_LIST_STACKING"
                         ,"_NET_CURRENT_DESKTOP"
                         ,"_NET_DESKTOP_NAMES"
                         ,"_NET_ACTIVE_WINDOW"
                         ,"_NET_WM_DESKTOP"
                         ,"_NET_WM_STRUT"
                         ]
    io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)
    setWMName "xmonad"

myFullscreenSupport :: XConfig a -> XConfig a
myFullscreenSupport c = c {
        startupHook     = startupHook c <+> setSupportedWithFullscreen,
        handleEventHook = handleEventHook c +++ fullscreenEventHook
    } where x +++ y = mappend y x
