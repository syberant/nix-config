-- Switch between different sets of workspaces assigned to specific projects.
--
-- Plan:
--   Always have a default '' project as fallback
--   Get every project their own workspaces 5-9
--   Use an XMonad Prompt and picker to switch between projects and create new ones
--   Delete a project if no open windows?
--
-- TODO:
--   Remove `Project` type, it does not serve any purpose
--
-- Links:
-- https://hackage.haskell.org/package/xmonad-contrib-0.17.1/docs/XMonad-Actions-DynamicWorkspaces.html
-- https://hackage.haskell.org/package/xmonad-contrib-0.17.1/docs/XMonad-Util-ExtensibleState.html
-- https://www.reddit.com/r/xmonad/comments/fgyzc/xmonadactionsdynamicworkspaces_where_have_you/

module Projects (switchProject, removeCurrentProject) where

import           Control.Monad                    (mapM_)
import qualified Data.Map.Strict                  as Map
import           Hide                             (hideWorkspace, showWorkspace)
import           XMonad
import           XMonad.Actions.DynamicWorkspaces (addHiddenWorkspaceAt,
                                                   removeWorkspaceByTag)
import           XMonad.Prompt                    (XPConfig,
                                                   mkComplFunFromList',
                                                   mkXPrompt)
import           XMonad.Prompt.Workspace          (Wor (Wor))
import           XMonad.StackSet                  (greedyView)
import qualified XMonad.Util.ExtensibleState      as XS


data ProjectState = State
    { activeProjectName :: String
    , projects          :: Map.Map String Project
    } deriving (Read, Show)
instance ExtensionClass ProjectState where
    initialValue = State defaultProject $ Map.singleton defaultProject (Project defaultProject 5)
    extensionType = PersistentExtension

activeProject (State active projs) = projs Map.! active

data Project = Project
    { name   :: String
    , number :: Int
    } deriving (Read, Show)

defaultProject = ""
projectTags (Project name n) = map (\x -> name ++ show x) $ map (4+) [1..n]

refreshHideList :: X()
refreshHideList = do
    st@(State act projs) <- XS.get
    mapM_ hideWorkspace (concat $ map projectTags $ Map.elems projs)
    mapM_ showWorkspace (projectTags $ activeProject st)

switchProject :: XPConfig -> X ()
switchProject conf = do
        (State _ projs) <- XS.get
        mkXPrompt (Wor "Project name: ") conf (mkComplFunFromList' conf $ Map.keys projs) switchOrAdd
    where
        -- compl = const (return [])
        switchOrAdd name = do
                (State _ projs) <- XS.get
                if Map.member name projs then return () else addProject name
                (State _ projs) <- XS.get
                XS.put (State name projs)
                refreshHideList
                windows (greedyView $ name ++ "7")


addProject :: String -> X ()
addProject name = do
        XS.modify changeState
        mapM_ appendWorkspace $ projectTags proj
    where
        proj = Project name 5
        changeState (State act projs) = State act $ Map.insert name proj projs
        appendWorkspace = addHiddenWorkspaceAt (\x xs -> x:xs)

removeCurrentProject :: X ()
removeCurrentProject = do
    (State active _) <- XS.get
    if active == defaultProject then return () else removeProject active
    refreshHideList

removeProject :: String -> X ()
removeProject name = do
        state <- XS.get
        delWorkspaces (activeProject state)
        if activeProjectName state == name then windows (greedyView $ defaultProject ++ "1") else return ()
        XS.put (changeState state)
    where
        changeState (State act projs)
            | act == name = State defaultProject (Map.delete name projs)
            | otherwise = State act (Map.delete name projs)
        delWorkspaces proj = mapM_ removeWorkspaceByTag (projectTags proj)
