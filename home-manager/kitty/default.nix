{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode";
      shell = "zsh";
      font_size = "10.5";
      adjust_line_height = "0";
      adjust_column_width = "0";
      disable_ligatures = "never";
      cursor_shape = "underline";
      scrollback_lines = "9000";
      mouse_hide_wait = "3.0";
      url_style = "single";
      open_url_with = "default";
      copy_on_select = "yes";
      strip_trailing_spaces = "smart";
      focus_follows_mouse = "yes";
      repaint_delay = "10";
      input_delay = "1";
      sync_to_monitor = "no";
      remember_window_size = "yes";
      initial_window_width = "1920";
      initial_window_hiehgt = "1080";
      enabled_layouts = "tall:bias=70";
      window_border_width = "1.0";
      draw_minimal_borders = "yes";
      window_margin_width = "0.0";
      active_border_color = "#00ff00";
      inactive_border_color = "#cccccc";
      bell_border_color = "#ff5a00";
      inactive_text_alpha = "1.0";
      hide_window_decorations = "yes";
      resize_debounce_time = "0.1";
      resize_draw_strategy = "static";
      kitty_mod = "ctrl+shift";
      term = "xterm-kitty";
      clipboard_control = " write-clipboard write-primary";
      background_opacity = "0.9";
      dim_opacity = "0.6";
      background = "#24283b";
    };

    keybindings = {
      "kitty_mod+t" = "launch --cwd=current --type=tab";
      "kitty_mod+n" = "launch --cwd=current";
      "kitty_mod+enter" = "new_window_with_cwd";
      "kitty_mod+o" = "exec rofi -show run";
  };
  };
}
