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
    spawn "bash -c 'if ! ( ps -fA | grep -i \" [s]talonetray\" ); then echo \"running startup commands\" &&\
    \ \"stalonetray\" & \
    \ echo \"stalonetray started\" &&\
    \ export LANG=en_US.UTF-8 &&\
    \ echo \"LANG set\" &&\
    \ xsetroot -cursor_name \"left_ptr&\" &&\
    \ echo \"cursor set\" &&\
    \ feh --bg-scale /home/vatrat/foto/background/wallpaper.png &&\
    \ echo \"background set\" &&\
    \ setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl &&\
    \ echo \"keyboard layout set to US Extended\" &&\
    \ setxkbmap -option \"caps:escape\" &&\
    \ echo \"caps and escape swapped\" &&\
    \ xmodmap -e \"keycode 133 = ISO_Level3_Shift\" &&\
    \ echo \"Windows key is now ISO_Level3_Shift\" &&\
    \ xmodmap -e \"keycode 135 = ISO_Level3_Shift\" &&\
    \ echo \"Menu key is now ISO_Level3_Shift\" &&\
    \ xmodmap -e \"keycode 108 = Alt_L\" &&\
    \ echo \"Alt keys are now both Alt_L\" &&\
    \ xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Tapping Enabled\" 1 &&\
    \ echo \"fixed Acer laptop trackpad tap-to-click\" &&\
    \ echo xmonad started; else echo xmonad already running, no action; fi' >~/xmlog 2>&1"
    xmproc <- spawnPipe "xmobar"

    xmonad $ def
        { manageHook=manageHook def <+> manageDocks 
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 70
                        }
        , layoutHook=avoidStruts $ layoutHook def
        -- , layoutHook = myLayout
        , terminal = "gnome-terminal"
        --, modMask = mod4Mask     -- Rebind Mod to the Windows key
        -- , startupHook = spawn "xmodmap -e 'add mod4 = Menu'"
        } `additionalKeys`
            [ 
              ((mod1Mask, xK_z), spawn "slock")
              -- ,((mod1Mask, xK_Print), spawn "scrot -s")
              ,((mod1Mask, xK_Print), spawn "import -window root $HOME/foto/shot/$(date +%Y_%m_%d-%H%M%S).png")
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
                
              ,((0, 0x1008FF11), spawn "amixer set Master 7%-")
              ,((0, 0x1008FF13), spawn "amixer set Master 7%+")
              ,((0, 0x1008FF12), spawn "amixer -D pulse set Master toggle")

            ]
