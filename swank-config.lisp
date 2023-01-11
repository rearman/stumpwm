(ql:quickload "swank")
(require :swank)
(swank-loader:init)

(defparameter *port-number* 4004
  "My default port number for Swank")

(defvar *swank-server-p* nil
  "Keep track of swank server, turned off by default on startup")

(defcommand start-swank () ()
  "Start Swank if it is not already running"
  (if *swank-server-p*
      (message "Swank server is already active on Port^5 ~a^n" *port-number*)
    (progn
	(swank:create-server :port *port-number*
			     :dont-close t)
	(setf *swank-server-p* t)
	(message "Swank server is now active on Port^5 ~a^n.
Use^4 M-x slime-connect^n in Emacs.
Type^2 (in-package :stumpwm)^n in Slime REPL." *port-number*))))

(defcommand stop-swank () ()
  "Stop Swank"
  (swank:stop-server *port-number*)
  (setf *swank-server-p* nil)
  (message "Stopping Swank Server! Closing Port^5 ~a^n." *port-number*))

(defcommand toggle-swank () ()
  (if *swank-server-p*
      (run-commands "stop-swank")
      (run-commands "start-swank")))


 ;;modeline status
(defun get-swank-status ()
  (if *swank-server-p*
      (setf *swank-ml-status* (format nil "Swank:^2 ~a^n | " *port-number*))
      (setf *swank-ml-status* "Swank: off | ")))

(defun ml-fmt-swank-status (ml)
  (declare (ignore ml))
  (get-swank-status))

(add-screen-mode-line-formatter #\S #'ml-fmt-swank-status)
