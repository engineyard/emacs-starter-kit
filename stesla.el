;; Keybindings
(global-set-key (kbd "C-x h") 'mark-whole-buffer)

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

;; Enable nice display of column and line numbers in the modeline
(column-number-mode)

;; Erlang Stuff
(add-to-list 'load-path "~/.emacs.d/vendor/distel/elisp")
(require 'distel)
(distel-setup)

(setq erlang-indent-level 2)
(setq erlang-compile-function 'stesla-compile-function)
(let* ((mnesia-dir (concat (expand-file-name "~/.emacs.d/") "mnesia"))
       (quoted-mnesia-dir (concat "\"" mnesia-dir "\""))
       (options (list "-sname" "emacs" "-mnesia" "dir" quoted-mnesia-dir)))
  (setq inferior-erlang-machine-options options))

(defun stesla-compile-function ()
  (interactive)
  (let ((olddir (pwd))
        (dir (locate-dominating-file (buffer-file-name) "Rakefile")))
    (cd dir)
    (unwind-protect
        (compile "rake")
      (cd olddir))))      
