if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g EDITOR nvim
set -g VISUAL nvim
set -gx TERMINAL wezterm

#xinput set-prop 10 307 -0.5

abbr --add lg lazygit
abbr --add ylg yadm enter lazygit
abbr --add yadd yadm add
alias lf="lfcd"

zoxide init fish --cmd cd | source
