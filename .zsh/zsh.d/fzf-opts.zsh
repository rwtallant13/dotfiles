# -- fzf
export FZF_DEFAULT_OPTS="--preview-window noborder --reverse --exact --multi --cycle --border=sharp --height=50% --no-info --color=spinner:#89DDFF,hl:#82AAFF --color=fg:#d6d6d6,header:#82AAFF,info:#FFCB6B,pointer:#89DDFF --color=marker:#89DDFF,fg+:#EEFFFF,prompt:#FFCB6B,hl+:#82AAFF"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50' --exact"
export FZF_CTRL_T_COMMAND="fd . --hidden"
export FZF_ALT_C_COMMAND='fd . --hidden -t d -t l'
export FZF_CTRL_R_OPTS='--exact'
