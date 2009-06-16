;; seriously
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)

;; haml
(require 'haml-mode nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;;;;;;;;;; stuff that's not on ELPA. too lazy to upload it.

;; line numbers on the left in a gui
(when window-system
  (add-to-list 'load-path "~/.emacs.d/vendor/linum")
  (require 'linum)
  (global-linum-mode 1))

