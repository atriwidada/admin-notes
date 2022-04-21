#!/bin/bash

sudo xauth add $(xauth -f ~$(USER)/.Xauthority list|tail -1)
