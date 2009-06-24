;; Pretty Colors
(color-theme-twilight)

;; I actually don't like auto-fill most of the time.
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; keen select mode
(add-to-list 'load-path "~/.emacs.d/vendor/keen")
(require 'keen-select)

(keen-select-define-key user-init-file "."
  (find-buffer-visiting user-init-file)
  (find-file user-init-file))

(keen-select-define-key shell "!"
  (find-buffer-visiting "*eshell*")
  (eshell))
