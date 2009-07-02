;; for those of us lacking superhuman eyeballs
(set-cursor-color "black")

;; seriously
(setq kill-whole-line t)
(setq confirm-kill-emacs 'yes-or-no-p)
(random t)                              ; reseed
(server-start)
(global-auto-revert-mode 1)


;; Mac-specific stuff
(when (eq window-system 'ns)
  (setq mac-command-modifier 'meta))


;; while I <square box> Unicode as much as the next guy,
;; I want my lambdas left alone.
(remove-hook 'coding-hook 'pretty-lambdas)

;; don't iconify on C-z when running in X
;; or exit emacs (!) when running in Emacs.app
(when window-system (global-unset-key "\C-z"))

;; don't use ESC as a prefix, but rather do the same thing C-g does.
(global-set-key (kbd "<escape>") 'keyboard-quit)

;; haml
(require 'haml-mode nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; just nice to have everywhere
(add-hook 'coding-hook (lambda () (setq tab-width 2)))

;; hooray hippie-expand
(setq hippie-expand-try-functions-list (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))
(global-set-key [(control tab)] 'hippie-expand)

;; Other Random Keybindings
(global-set-key [(kp-delete)] 'delete-char)
(global-set-key [(f6)] 'next-error)
(global-set-key [(shift f6)] 'previous-error)
(global-set-key [(control backspace)] 'backward-kill-word)
(global-set-key [(control kp-delete)] 'kill-word)

;;;;;;;;;; stuff that's not on ELPA. too lazy to upload it.

;;;;;;;; line numbers on the left in a gui
(when window-system
  (add-to-list 'load-path "~/.emacs.d/vendor/linum")
  (require 'linum)
  (global-linum-mode 1))

;;;;;;;; spiffy mode
(add-to-list 'load-path "~/.emacs.d/vendor/spiffy")
(setq spiffy-enable-minor-mode t)
(require 'spiffy)

;;;;;;;; spiffy textmate mode
(require 'spiffy-textmate-mode)
(add-hook 'coding-hook 'spiffy-textmate-mode)

;;;;;;;; spiffy macos mode
(autoload 'spiffy-macos-mode "spiffy-macos-mode" nil t)

;; get the tabstops right for spiffy-textmate-mode's indentations
(setq tab-stop-list
      (mapcar (lambda (x) (* 2 x))
              (reverse (spiffy-downfrom 100))))

;;;;;;;; Ruby
(require 'spiffy-ruby-mode)
(add-hook 'ruby-mode-hook 'spiffy-ruby-mode)

(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)

(yas/load-directory "~/.emacs.d/snippets")

;; rackup files are ruby too
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))

;;;;;;;; color is good - let's actually see ansi-color stuff in color.
(require 'ansi-color)
(require 'comint)
(require 'compile)
(setq ansi-color-for-comint-mode t)
(add-hook 'comint-output-filter-functions 'ansi-color-process-output)

;;;;;;;; emacs-lisp development
(add-to-list 'load-path "~/.emacs.d/vendor/el-expectations")
(defun eval-and-execute-expectations-buffer ()
  (interactive)
  (eval-buffer)
  (expectations-execute))

;;;;;;;; feature (cucumber) mode
(add-to-list 'load-path "~/.emacs.d/vendor/cucumber")
(require 'feature-mode)

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (local-set-key [(control ?\;) ?r ?t] 'eval-and-execute-expectations-buffer)
   (local-set-key [(return)] 'newline-and-indent)))

;;;;;;;; To launch nav on left side: M-x nav RET
;;;;;;;; To launch nav on right side: C-u M-x nav RET
(defadvice other-window (around other-window-nop))
(defadvice nav (around prefix-nav)
  (if current-prefix-arg
      (ad-activate-regexp "other-window-nop"))
  (unwind-protect
      ad-do-it
    (ad-deactivate-regexp "other-window-nop")))
(ad-activate-regexp "prefix-nav")

;;;;;;;; eopen support
(require 'eopen)
(eopen-launch)