#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

	{sep => "QUICK START"},
    
    #         COMMAND                                             LABEL                     ICON
    {item => ["bash -c '~/.config/rofi/scripts/appsmenu.sh'",     "Launch Apps",            "preferences-system-login"]},    
    {item => ["exo-open --launch TerminalEmulator",               "Open Terminal",          "utilities-terminal"]},
    
    {sep  => undef},
    
    # Screenshot Menu
    {beg  => ["Screenshot",                                                                 "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-now'",                    "Now",                    "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-5sec'",                   "After 5s",               "deepin-screenshot"]},
    {item => ["bash -c '~/.scripts/shot-seldraw'",                "Select window or draw",  "deepin-screenshot"]},
    {end  => undef},

    {pipe => ["python2 ~/.config/openbox/pipe-menu/ob-randr.py",  "Monitor Settings",       "preferences-desktop-display"]},
    {obgenmenu => ["Advanced Settings",                                                     "preferences-system"]},
    
    {sep  => undef},
    
    {sep => "SESSIONS"},
    
    # Switcher Visual Mode & OB Button location
    {item => ["bash -c '~/.scripts/ob-button-switcher'"         , "Switch Button L/R" ,     "preferences-desktop-theme-windowdecorations"]},
    {item => ["bash -c '~/.config/openbox/visual-mode/switcher'", "Change Visual Mode",     "preferences-desktop-theme"]},
    
    {sep  => undef},
    
    # Lockscreen Menu
    {item => ["bash -c '~/.scripts/lockscreen'",                   "Lockscreen",            "system-lock-screen"]},
    
    # Logout Menu    
    {exit => ["Exit Openbox",                                                               "system-log-out"]},

    # This uses the "oblogout" menu
    #{item => ["oblogout", "Exit", "application-exit"]},
]
