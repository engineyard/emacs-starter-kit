(defun emate-launch ()
  (let ((dir (getenv "EMATE_DIR"))
        (file (getenv "EMATE_FILE")))
    (if dir
        (emate-launch-dir dir)
      (if file
          (emate-launch-file)))))

(defun emate-launch-dir (dir)
  "Launch emacs like textmate launched on a directory"
  (cd dir)
  (nav))

(defun emate-launch-file (file)
  "Launch emacs like textmate launched on a (possibly non-existant) file"
  (find-file file))

(provide 'starter-kit-launch)