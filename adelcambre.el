(color-theme-twilight)
(defun textmate-project-root ()
  (spiffy-tm-project-root-for (buffer-file-name)))
(define-key minibuffer-local-map [(escape)] 'minibuffer-keyboard-quit)
(add-to-list 'load-path "~/.emacs.d/vendor/")
(require 'peepopen)
(setq ns-pop-up-frames nil)
(define-key *spiffy-tm-keymap* [(meta ?t)] 'peepopen-goto-file-gui)

(defun open (project) (interactive (list (read-string "Peepopen for project (default awsm): " nil nil "awsm")))
  (flet ((textmate-project-root () (concat "~/p/ey/" project)))
    (peepopen-goto-file-gui)))

(global-set-key [(meta ?o)] 'open)
;; (require 'ack-in-project)

