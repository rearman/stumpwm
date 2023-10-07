(in-package :stumpwm)

; (load "~/quicklisp/setup.lisp")

; (load "~/.stumpwm.d/swank-config.lisp")
(load "~/.stumpwm.d/definitions.lisp")
(load "~/.stumpwm.d/bindings.lisp")

(setf *timeout-wait* 7
      *ignore-wm-inc-hints* t
      *window-format* "%n: %20t"
      *mouse-focus-policy* :click
      *message-window-gravity* :top
      *input-window-gravity* :top
      *message-window-padding*   5
      *message-window-y-padding* 5
      *group-format* "%t"
      *time-modeline-string* "%a %d %b %H:%M"
      *screen-mode-line-format*
      (list "^6[%g]^n "	"%W" "^>"
	    '(:eval *modelineinfo*)))

;; Create some threads that loop forever
(do-in-thread
    (lambda ()
      (loop do
	(progn
	  (setf *modelineinfo* (run-shell-command "sh ~/.stumpwm.d/modeline.sh" t))
	  (sleep 5)))))

;; turn on the mode line
(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen) (current-head)))

;; create list of workspaces
(grename (nth 0 *rush/workspaces*))
(dolist (workspace (cdr *rush/workspaces*))
  (gnewbg workspace))
