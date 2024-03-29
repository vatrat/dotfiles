import Data.Map(fromList)
import Data.Monoid(mappend)
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
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook,ewmh)
-----

-- mymanageHook :: [ManageHook]
mymanageHook = composeAll
                   [ className =? "Gimp"        --> doFloat
                   , resource  =? "stalonetray" --> doIgnore ]
                   -- , resource  =? "xmobar"       --> doIgnore ]
            -- , manageDocks
mylayoutHook = avoidStruts ( noBorders (tabbed shrinkText def) ||| ResizableTall 1 (1.5/100) (3/5) [] ||| noBorders (Full) )
-- Accordion Circle
-- myLayouts = toggleLayouts (noBorders Full) Tall ||| ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP
-----

main = do
  -- TODO move all this stuff to .xinitrc or something so it applies across DE
    -- spawn "bash -c 'if ! ( ps -fA | grep -i \" [s]talonetray\" ); then echo \"running startup commands\" &&\
    -- \ \"stalonetray\" & \
    -- \ echo \"stalonetray started\" &&\
    -- \ export LANG=en_US.UTF-8 &&\
    -- \ echo \"LANG set\" &&\
    -- \ xset b off &&\
    -- \ echo \"turned off bell\" &&\
    -- \ xsetroot -cursor_name \"left_ptr&\" &&\
    -- \ echo \"cursor set\" &&\
    -- \ setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl &&\
    -- \ echo \"keyboard layout set to US Extended\" &&\
    -- \ setxkbmap -option \"caps:escape\" &&\
    -- \ echo \"caps and escape swapped\" &&\
    -- \ xmodmap -e \"keycode 133 = ISO_Level3_Shift\" &&\
    -- \ echo \"Windows key is now ISO_Level3_Shift\" &&\
    -- \ xmodmap -e \"keycode 135 = ISO_Level3_Shift\" &&\
    -- \ echo \"Menu key is now ISO_Level3_Shift\" &&\
    -- \ xmodmap -e \"keycode 108 = Alt_L\" &&\
    -- \ echo \"Alt keys are now both Alt_L\" &&\
    -- \ feh --bg-scale /home/vatrat/foto/background/wallpaper.png &&\
    -- \ echo \"background set\" &&\
    -- \ echo xmonad started; else echo xmonad already running, no action; fi' >~/xmlog 2>&1"
    -- -- \ xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Tapping Enabled\" 1 &&\
    -- -- \ echo \"fixed Acer laptop trackpad tap-to-click\" &&\
    -- -- \ xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Natural Scrolling Enabled\" 0 &&\
    -- -- \ echo \"Turned off natural scrolling\" &&\
    -- -- \ xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Disable While Typing Enabled\" 0 &&\
    -- -- \ echo \"Turned off disable trackpad while typing\" &&\

    xmproc <- spawnPipe "xmobar"
    xmonad $ ewmh $ docks def
        { manageHook = manageDocks <+> mymanageHook --manageHook def
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
              ((mod1Mask, xK_z), spawn "bash ~/.xmonad/.xmonad_lock.sh")
              ,((mod1Mask .|. shiftMask, xK_z), spawn "/home/vatrat/.xmonad/.suspend.sh")
              ,((mod1Mask .|. controlMask, xK_z), spawn "/home/vatrat/.xmonad/.hibernate.sh")
              ,((mod1Mask, xK_Print),
      spawn "import -window root $HOME/foto/shot/$(date +%Y_%m_%d-%H%M%S).png")

              -- Application launching keybindings
              ,((mod1Mask, xK_d), spawn "rofi -show drun -show-icons")
              ,((mod1Mask .|. shiftMask, xK_d), spawn "dmenu_run")
              -- ,((mod1Mask, xK_p), spawn "rofi -show run")
              ,((mod1Mask, xK_f), spawn "rofi -show window")
              ,((mod1Mask, xK_e), spawn "gnomesu ls")

              -- (Spac)Emacs launch keybindings
              ,((mod1Mask, xK_s), spawn "emacsclient -c -a ''")

              ,((mod1Mask .|. shiftMask, xK_f), spawn "nautilus -w")
              ,((mod1Mask, xK_c), spawn "google-chrome")

              -- Gnome Control Center launch keybindings
              -- ,((mod1Mask, xK_s), spawn "gnome-control-center")
              -- ,((mod1Mask .|. shiftMask, xK_b),
              --                           spawn "gnome-control-center bluetooth")
              -- ,((mod1Mask, xK_b),
              --                               spawn "gnome-control-center power")
              ,((mod1Mask .|. shiftMask, xK_w),
                                          spawn "nmcli-dmenu")

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



              -- xbacklight no longer works for some fucking reason, so let's use
              -- brightnessctl

              -- -- Make backlight brightness keys function correctly
              -- -- Coarse adjust
              -- -- (Time is shorter because I use this when I want it brighter/dimmer NOW)
              -- ,((mod1Mask , xF86XK_MonBrightnessUp ),
              --                                         spawn "xbacklight -inc 20 -time 50")
              -- ,((mod1Mask , xF86XK_MonBrightnessDown ),
              --                                         spawn "xbacklight -dec 20 -time 50")
              -- -- Medium adjust
              -- ,((0, xF86XK_MonBrightnessUp ), spawn "xbacklight -inc 10 -time 150")
              -- ,((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -dec 10 -time 150")
              -- -- Fine adjust
              -- ,((shiftMask, xF86XK_MonBrightnessUp ),
              --                                       spawn "xbacklight -inc 5 -time 150")
              -- ,((shiftMask, xF86XK_MonBrightnessDown ),
              --                                       spawn "xbacklight -dec 5 -time 150")
              -- -- Very Fine adjust (lol)
              -- -- (Time is 0 because it's 1%, it should be immediate)
              -- ,((mod1Mask .|. shiftMask, xF86XK_MonBrightnessUp ),
              --                                         spawn "xbacklight -inc 1 -time 0")
              -- ,((mod1Mask .|. shiftMask, xF86XK_MonBrightnessDown ),
              --                                         spawn "xbacklight -dec 1 -time 0")
              -- Coarse adjust

              ,((mod1Mask , xF86XK_MonBrightnessUp ),
                                                      spawn "brightnessctl set +20%")
              ,((mod1Mask , xF86XK_MonBrightnessDown ),
                                                      spawn "brightnessctl set 20%-")
              -- Medium adjust
              ,((0, xF86XK_MonBrightnessUp ), spawn "brightnessctl set +10%")
              ,((0, xF86XK_MonBrightnessDown ), spawn "brightnessctl set 10%-")
              -- Fine adjust
              ,((shiftMask, xF86XK_MonBrightnessUp ),
                                                    spawn "brightnessctl set +5%")
              ,((shiftMask, xF86XK_MonBrightnessDown ),
                                                    spawn "brightnessctl set 5%-")
              -- Very Fine adjust (lol)
              ,((mod1Mask .|. shiftMask, xF86XK_MonBrightnessUp ),
                                                      spawn "brightnessctl set +1%")
              ,((mod1Mask .|. shiftMask, xF86XK_MonBrightnessDown ),
                                                      spawn "brightnessctl set 1%-")



              -- Keybindings
              ,((0, xK_F6), spawn "bash -c 'killall xdotool || while xdotool click --repeat 1000000 --delay 15 1; do :; done'")
            ]
