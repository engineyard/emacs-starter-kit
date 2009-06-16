;; seriously
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)

;; haml
(require 'haml-mode nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

