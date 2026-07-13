if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove the default greeting message
set -g fish_greeting ""

# Environment Variables (-gx exports globally)
set -gx EDITOR vim
set -gx PATH $HOME/.local/bin $PATH

# Abbreviations (Text snippets that expand when you press space)
abbr gs "git status"
abbr gp "git push"
abbr gcm "git commit -m"

# Aliases (Traditional wrapper functions)
alias ll "ls -lah"
alias la "ls -A"

