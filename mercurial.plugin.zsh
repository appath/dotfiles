# Mercurial Theme vars and functions
ZSH_THEME_HG_PROMPT_PREFIX="hg:("          # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_HG_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_HG_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_HG_PROMPT_CLEAN=""               # Text to display if the branch is clean

# get the name of the branch we are on
function hg_prompt_info() {
  ref=$(hg branch 2> /dev/null) || return
  echo "$ZSH_THEME_HG_PROMPT_PREFIX${ref}$(parse_hg_dirty)$ZSH_THEME_HG_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_hg_dirty() {
  if [[ -n $(hg status 2> /dev/null) ]]; then
    echo "$ZSH_THEME_HG_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_HG_PROMPT_CLEAN"
  fi
}

