(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(require 'color-theme)
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.4/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

