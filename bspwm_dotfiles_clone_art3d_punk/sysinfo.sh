#!/usr/bin/env sh

# sysinfo.sh - displays system info
# parody of the neofetch (https://github.com/dylanaraps/neofetch)...

# Colors
f=3 b=4
for j in f b; do
	for i in {0..7}; do
		printf -v $j$i "%b" "\e[${!j}${i}m"
	done
done

bld=$'\e[1m'
rst=$'\e[0m'
inv=$'\e[7m'

# Detect
kernel=$(uname -r)
kernel=${kernel%-*}
kernel=${kernel%_*}
shell=$(basename $SHELL)

url() {
	url=$(source /etc/os-release && echo $HOME_URL)
	export url
}

os() {
	os=$(source /etc/os-release && echo $NAME)
	export os
}

wm() {
	id=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)
	id=${id##* }
	wm=$(xprop -id "$id" -notype -len 100 -f _NET_WM_NAME 8t)
	wm=${wm/*_NET_WM_NAME = }
	wm=${wm/\"}
	wm=${wm/\"*}
	wm=${wm,,}
	export wm
}

init() {
	init=$(readlink /sbin/init)
	init=${init##*/}
	init=${init%%-*}
	export init
}

bar_cols() {
	for color in 0 1 2 3 4 5 6 7; do
	printf "\033[4${color}m "
	done
}

# Exec..
os
wm
init
url

cat <<EOF

│ ${f2}Os${rst}:          ${f7}$os${rst}
│ ${f2}Kernel${rst}:      ${f1}$kernel${rst} 
│ ${f2}Shell${rst}:       ${f7}$shell${rst}				
│ ${f2}Init${rst}:        ${f7}$init${rst}
│ ${f2}Wm${rst}:          ${f7}$wm${rst}
│ ${f2}Url${rst}:         ${f7}$url${rst}

┌───────────────────┐
│   ; ${f4}Coffee Lake${rst}   │
└───────────────────┘

EOF

# Exec bar bottom colors
bar_cols

cat <<EOF
$bar_cols

EOF

#####################
# ;    The End    ; #
#####################
