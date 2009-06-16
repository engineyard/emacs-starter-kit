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

;; hooray hippie-expand
(setq hippie-expand-try-functions-list (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))
(global-set-key [(f6)] 'next-error)
(global-set-key [(shift f6)] 'previous-error)
(global-set-key [(control tab)] 'hippie-expand)


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

;; get the tabstops right for spiffy-textmate-mode's indentations
(setq tab-stop-list
      (mapcar (lambda (x) (* 2 x))
              (reverse (spiffy-downfrom 100))))

;;;;;;;; Ruby
(require 'spiffy-ruby-mode)
(add-hook 'ruby-mode-hook 'spiffy-ruby-mode)

(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)

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

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (local-set-key [(control ?\;) ?r ?t] 'eval-and-execute-expectations-buffer)
   (local-set-key [(return)] 'newline-and-indent)))
