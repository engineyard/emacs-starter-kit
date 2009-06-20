;; clojure + slime
(add-to-list 'load-path "~/.emacs.d/vendor/swank-clojure")
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-extra-vm-args '("-Xmx1g"))
 (setq swank-clojure-jar-path "~/clojure/clojure.jar")
 (setq swank-clojure-extra-classpaths '("~/clojure-contrib/clojure-contrib.jar" "~/euler/lib")))

(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(require 'slime)
(slime-setup)
