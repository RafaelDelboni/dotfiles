#!/usr/bin/env bash

[[ -z "${LOCAL_DPI_FACTOR}" ]] && WINIT_HIDPI_FACTOR=1.4 || WINIT_HIDPI_FACTOR="${LOCAL_DPI_FACTOR}"
WINIT_HIDPI_FACTOR=$WINIT_HIDPI_FACTOR alacritty -e tmux new-session
