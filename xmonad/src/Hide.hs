module Hide (hiddenWorkspaces,  hideWorkspace, showWorkspace, withNthFilteredWorkspace) where

import qualified Data.List                    as List
import qualified Data.Set                     as S
import           XMonad                       hiding (workspaces)
import           XMonad.StackSet              (greedyView, tag, workspaces)
import qualified XMonad.Util.ExtensibleState  as XS
import           XMonad.Util.WorkspaceCompare (getSortByIndex)


data HideState = State
    { ws          :: S.Set String
    } deriving (Read, Show)
instance ExtensionClass HideState where
    initialValue = State $ S.singleton "NSP"
    extensionType = PersistentExtension

hideWorkspace :: String -> X ()
hideWorkspace name = do
    (State ws) <- XS.get
    XS.put $ State $ S.insert name ws

showWorkspace :: String -> X ()
showWorkspace name = do
    (State ws) <- XS.get
    XS.put $ State $ S.delete name ws

hiddenWorkspaces :: X [String]
hiddenWorkspaces = do
    (State ws) <- XS.get
    return $ S.elems ws

-- Modified from: https://hackage.haskell.org/package/xmonad-contrib-0.17.1/docs/src/XMonad.Actions.DynamicWorkspaces.html#withNthWorkspace
withNthFilteredWorkspace :: (String -> WindowSet -> WindowSet) -> Int -> X ()
withNthFilteredWorkspace job wnum = do
    hidden <- hiddenWorkspaces
    s <- getSortByIndex
    ws <- gets (map tag . s . workspaces . windowset)
    case drop wnum (ws List.\\ hidden) of
        (w:_) -> windows $ job w
        []    -> return ()
