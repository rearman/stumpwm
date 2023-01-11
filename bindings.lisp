(undefine-key *root-map* (kbd "a"))
(undefine-key *root-map* (kbd "C-a"))
(undefine-key *root-map* (kbd "e"))
(undefine-key *root-map* (kbd "q"))
(undefine-key *root-map* (kbd "C-q"))

(define-key *top-map* (kbd "s-Up") "gnext")
(define-key *top-map* (kbd "s-Down") "gprev")
(define-key *top-map* (kbd "s-Right") "pull-hidden-next")
(define-key *top-map* (kbd "s-Left") "pull-hidden-previous")
(define-key *top-map* (kbd "s-S-Right") "gnext-with-window")
(define-key *top-map* (kbd "s-S-Left") "gprev-with-window")
(define-key *top-map* (kbd "s-SPC") "fnext")
(define-key *top-map* (kbd "s-l") "exec xlock")
(define-key *top-map* (kbd "s-s") "toggle-swank")
(define-key *top-map* (kbd "s-r") "better-restart")

(define-key *root-map* (kbd "b") "firefox")
(define-key *root-map* (kbd "c") "exec st")
(define-key *root-map* (kbd "C-c") "exec 9 9term")
(define-key *root-map* (kbd "e") "start-emacs-client")
(define-key *root-map* (kbd "m") "thunderbird")
(define-key *root-map* (kbd "q") "better-quit")
(define-key *root-map* (kbd "C-q") "abort")
(define-key *root-map* (kbd "t") "time")
