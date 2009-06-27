(defun emate-launch ()
  (let (dir file)
    (setq dir (getenv "EMATE_DIR"))
    (setq file (getenv "EMATE_FILE"))

    (if dir (progn (cd dir) (nav)))
    )) ;; (if file (load-file file))))

(provide 'starter-kit-launch)