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
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.Paste
import XMonad.Util.Run(spawnPipe)
import XMonad.Layout.Circle
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
-----

-- mymanageHook :: [ManageHook]
mymanageHook = composeAll
                   [ className =? "Gimp"        --> doFloat
                   , resource  =? "stalonetray" --> doIgnore
                   , resource  =? "xmobar"       --> doIgnore ]
            -- , manageDocks
mylayoutHook = avoidStruts ( ResizableTall 1 (1.5/100) (3/5) [] ||| noBorders (Full) ||| noBorders (tabbed shrinkText def) ||| Accordion ||| Circle )
-- myLayouts = toggleLayouts (noBorders Full) Tall ||| ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP
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
        { manageHook = manageDocks <+> manageHook def
        , layoutHook = mylayoutHook
--avoidStruts $ layoutHook def
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 70
                        }
       , borderWidth        = 1
       , normalBorderColor  = "#8e8d8d"
       , focusedBorderColor = "#2e64ba"
       , terminal = "gnome-terminal"
        } `additionalKeys`
            [
              ((mod1Mask, xK_z), spawn "slock")
              ,((mod1Mask, xK_Print), spawn "import -window root $HOME/foto/shot/$(date +%Y_%m_%d-%H%M%S).png")

              -- Application launching keybindings
              ,((mod1Mask, xK_p), spawn "rofi -show run")
              ,((mod1Mask .|. shiftMask, xK_p), spawn "dmenu_run")

              -- (Spac)Emacs launch keybindings
              ,((mod1Mask, xK_e), spawn "emacsclient -c -a ''")
              ,((mod1Mask .|. shiftMask, xK_e), spawn "emacsclient -a ''")


              -- Gnome Control Center launch keybindings
              ,((mod1Mask, xK_s), spawn "gnome-control-center")
              ,((mod1Mask .|. shiftMask, xK_b), spawn "gnome-control-center bluetooth")
              ,((mod1Mask, xK_b), spawn "gnome-control-center power")
              ,((mod1Mask .|. shiftMask, xK_w), spawn "gnome-control-center network")

              -- Keybindings to switch windows directionally
              ,((mod1Mask, xK_l), windowGo R False)
              ,((mod1Mask, xK_h), windowGo L False)
              ,((mod1Mask, xK_j), windowGo D False)
              ,((mod1Mask, xK_k), windowGo U False)

              -- Keybindings to move windows directionally
              ,((mod1Mask .|. shiftMask, xK_l), windowSwap R False)
              ,((mod1Mask .|. shiftMask, xK_h), windowSwap L False)
              ,((mod1Mask .|. shiftMask, xK_j), windowSwap D False)
              ,((mod1Mask .|. shiftMask, xK_k), windowSwap U False)

              ,((mod1Mask .|. shiftMask, xK_comma), sendMessage Expand)
              ,((mod1Mask .|. shiftMask, xK_period), sendMessage Shrink)

              -- Make audio keys function correctly
              ,((0, 0x1008FF11), spawn "amixer set Master 7%-")
              ,((0, 0x1008FF13), spawn "amixer set Master 7%+")
              ,((0, 0x1008FF12), spawn "amixer -D pulse set Master toggle")

              -- Make backlight brightness keys function correctly
              , ((0, xF86XK_MonBrightnessUp ), spawn "xbacklight -inc 20")
              , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -dec 20")
            ]



