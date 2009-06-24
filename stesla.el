(color-theme-twilight)

;; keen select mode
(add-to-list 'load-path "~/.emacs.d/vendor/keen")
(require 'keen-select)

(keen-select-define-key user-init-file "."
  (find-buffer-visiting user-init-file)
  (find-file user-init-file))

(keen-select-define-key shell "!"
  (find-buffer-visiting "*eshell*")
  (eshell))
