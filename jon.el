;; erlang mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.4/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; distel
(let ((distel-dir "~/.emacs.d/vendor/distel/elisp"))
  (unless (member distel-dir load-path)
    (setq load-path (append load-path (list distel-dir)))))
(require 'distel)
(distel-setup)

(color-theme-twilight)

