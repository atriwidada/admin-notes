#!/bin/bash

# source: https://www.facebook.com/riyogarta/posts/pfbid0213XQNvJWxPHoxcLo19UZm6GpEksWk96WcFJruoBhU7JsFg5rJ1hiiPwrL9B5GVoQl?__cft__[0]=AZWdkLdNEiH4P3U_dwuFEH_mqri3VK9iq8jYnAiz9_ATZOHcrocY7rwl-jLNc14DKoExqwv2sVadb1y-Vqljyhqh0gZPvmvpXdjuFysBqw3_6A&__tn__=%2CO%2CP-R
echo need setup ~/.tmux.conf with this content:
echo new-session
echo set -g mouse on
echo set -g history-limit 10000

mosh $* -- tmux a
