;; for those of us lacking superhuman eyeballs
(set-cursor-color "black")

;; seriously
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)

;; haml
(require 'haml-mode nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; just nice to have everywhere
(add-hook 'coding-hook (lambda () (setq tab-width 2)))


;;;;;;;;;; stuff that's not on ELPA. too lazy to upload it.

;;;;;;;; line numbers on the left in a gui
(when window-system
  (add-to-list 'load-path "~/.emacs.d/vendor/linum")
  (require 'linum)
  (global-linum-mode 1))

;;;;;;;; spiffy textmate mode
(add-to-list 'load-path "~/.emacs.d/vendor/spiffy")
(require 'spiffy-textmate-mode)
(add-hook 'coding-hook 'spiffy-textmate-mode)

;; get the tabstops right for spiffy-textmate-mode's indentations
(setq tab-stop-list
      (mapcar (lambda (x) (* 2 x))
              (reverse (spiffy-downfrom 100))))

;;;;;;;; spiffy ruby mode
(require 'spiffy-ruby-mode)
(add-hook 'ruby-mode-hook 'spiffy-ruby-mode)
