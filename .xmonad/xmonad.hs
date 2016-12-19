import Data.Map    (fromList)
import Data.Monoid (mappend)
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
-- import XMonad.Layout.BinarySpacePartition
import XMonad.Actions.Navigation2D
import XMonad.Layout.Spacing
import XMonad.Util.Dzen
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Paste
import XMonad.Util.Run(spawnPipe)

-----

-- myLayout = emptyBSP

-----

myManagementHooks :: [ManageHook]
myManagementHooks = [
  resource =? "xmobar" --> doIgnore
  , resource =? "stalonetray" --> doIgnore
  -- , resource =? "trayer" --> doIgnore
  , manageDocks
  ]

-----

main = do
    spawn "./.xmonad.sh"
    xmproc <- spawnPipe "xmobar"
    spawn "stalonetray &"
    -- spawn "setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl"
    -- spawn "xmodmap -e \"keycode 133 = ISO_Level3_Shift\""
    -- spawn "xmodmap -e \"keycode 135 = ISO_Level3_Shift\""
    -- spawn "xmodmap -e \"keycode 108 = Alt_L\""

    xmonad $ def
        { manageHook=manageHook def <+> manageDocks 
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , layoutHook=avoidStruts $ layoutHook def
        -- , layoutHook = myLayout
        , terminal = "gnome-terminal"
        --, modMask = mod4Mask     -- Rebind Mod to the Windows key
        , startupHook = spawn "xmodmap -e 'add mod4 = Menu'"
        } `additionalKeys`
            [ --((0                     , 0x1008FF11), spawn "amixer set Master 7%-" >>= alert)
              --,((0                     , 0x1008FF13), spawn "amixer set Master 7%+" >>= alert)
              --,((0                     , 0x1008FF12), spawn "amixer -D pulse set Master toggle")

              ((mod1Mask, xK_z), spawn "slock")
              ,((mod1Mask, xK_Print), spawn "scrot -s")
              ,((mod1Mask, xK_p), spawn "rofi -show run")
              -- ,((mod1Mask, xK_d), dzenConfig return "testing")

              ,((mod1Mask, xK_l), windowGo R False)
              ,((mod1Mask, xK_h), windowGo L False)
              ,((mod1Mask, xK_j), windowGo D False)
              ,((mod1Mask, xK_k), windowGo U False)

              ,((mod1Mask .|. shiftMask, xK_l), windowSwap R False)
              ,((mod1Mask .|. shiftMask, xK_h), windowSwap L False)
              ,((mod1Mask .|. shiftMask, xK_j), windowSwap D False)
              ,((mod1Mask .|. shiftMask, xK_k), windowSwap U False)
                
              --,
            ]
