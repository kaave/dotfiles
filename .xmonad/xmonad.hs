import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops -- for chrome's fullscreen mode
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time<Paste>
import XMonad.Util.EZConfig             -- additionalKeysP
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn

-- Color Setting
colorBlue      = "#77A0D4"
colorGreen     = "#519CA5"
colorRed       = "#E15F67"
colorGray      = "#6E7E93"
colorWhite     = "#FDFDFE"
colorNormalbg  = "#333134"
colorfg        = "#D0CDD9"

main = do
    wsbar <- spawnPipe myBar
    xmonad $ ewmh defaultConfig
        { terminal           = "alacritty"
        , workspaces         = myWorkspaces
        , layoutHook         = avoidStruts $ (
          toggleLayouts (noBorders Full)
          $ myLayout
        )
        , startupHook        = myStartupHook
        , manageHook         = myManageHook
        , handleEventHook    = fullscreenEventHook -- for chrome's fullscreen mode
        , modMask            = mod4Mask
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook            = myLogHook wsbar
      }
      `additionalKeysP` myAdditionalKeysP

myExtraWorkspaces = [(xK_0, "0")]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] ++ (map snd myExtraWorkspaces)

myLayoutHook = avoidStruts $ layoutHook defaultConfig
myManageHook = manageHook defaultConfig <+> manageDocks

------------------------------------------------------------------
-- Style
------------------------------------------------------------------
myNormalBorderColor  = "#eeeeee"
myFocusedBorderColor = "#e57373"
myBorderWidth = 1

-- gapwidth
gapwidth = 4
gwU = 22
gwR = 0
gwD = 0
gwL = 0

myLayout = spacing gapwidth $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
  $ (ResizableTall 1 (1/55) (1/2) [])
  ||| Simplest

------------------------------------------------------------------
-- keyboard
------------------------------------------------------------------
myStartupHook = do
  -- key repeat
  spawn "xset r rate 200 40"

myAdditionalKeysP = [
    -- launcher
    ("M4-p", spawn "rofi -show run")

    -- device controls
    , ("<XF86MonBrightnessUp>", spawn "light -A 2")
    , ("<XF86MonBrightnessDown>", spawn "light -U 2")
    , ("<XF86AudioRaiseVolume>", unsafeSpawn "amixer set Master 5%+")
    , ("<XF86AudioLowerVolume>", unsafeSpawn "amixer set Master 5%-")
    , ("<XF86AudioMute>",        unsafeSpawn "amixer set Master toggle")
  ]

------------------------------------------------------------------
-- xmobar
------------------------------------------------------------------
myLogHook h = dynamicLogWithPP $ wsPP {
  ppOutput = hPutStrLn h
  }
myBar = "xmobar $HOME/.xmonad/xmobar.hs"
wsPP = xmobarPP { ppOrder           = \(ws:l:t:_)  -> [ws,t]
                , ppCurrent         = xmobarColor colorGreen colorNormalbg . \s -> "●"
                , ppUrgent          = xmobarColor colorfg    colorNormalbg . \s -> "●"
                , ppVisible         = xmobarColor colorGreen colorNormalbg . \s -> "⦿"
                , ppHidden          = xmobarColor colorfg    colorNormalbg . \s -> "●"
                , ppHiddenNoWindows = xmobarColor colorfg    colorNormalbg . \s -> "○"
                , ppTitle           = xmobarColor colorGreen colorNormalbg
                , ppOutput          = putStrLn
                , ppWsSep           = " "
                , ppSep             = "  "
                }
