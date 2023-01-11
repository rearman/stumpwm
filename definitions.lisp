;; VARS/PARAMS
(defvar *modelineinfo* "")
(defvar *rush/workspaces* (list "I" "II" "III"))
(defparameter *threads* '())  ; we stock all threads here

;; FUNCTIONS
(defun key-press-hook (key key-seq cmd)
  (declare (ignore key))
  (unless (eq *top-map* *resize-map*)
    (let ((*message-window-gravity* :bottom-right))
      (message "Keys: ~a" (print-key-seq (reverse key-seq))))
    (when (stringp cmd)
      ;; give 'em time to read it
      (sleep 0.3))))

(defmacro replace-hook (hook fn)
  `(remove-hook ,hook ,fn)
  `(add-hook ,hook ,fn))

(replace-hook *key-press-hook* 'key-press-hook)

(defun do-in-thread (fn)
  (setf *threads*
	(cons
	 (sb-thread:make-thread fn)
	 *threads*)))

(defun kill-all-threads ()
  (loop for th in *threads*
	do
	   (if (sb-thread:thread-alive-p th) (sb-thread:terminate-thread th))))

;; COMMANDS
(defcommand firefox () ()
  "Start Forefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "Firefox")))

(defcommand thunderbird () ()
  "Start Thunderbird or switch to it, if it is already running"
  (run-or-raise "thunderbird" '(:class "Thunderbird")))

(defcommand better-restart () ()
  (kill-all-threads)
  (eval-command "restart-hard"))

(defcommand better-quit () ()
  (let ((output (string-downcase (completing-read
				  (current-screen)
				  "Command: "
				  (list "reboot" "shutdown" "quit")))))
    (if (string/= output "")
	(cond ((string= output "reboot")
	       (kill-all-threads)
	       (run-shell-command "reboot"))
	      ((string= output "shutdown")
	       (kill-all-threads)
	       (run-shell-command "halt -p"))
	      ((string= output "quit")
	       (kill-all-threads)
	       (eval-command "quit"))
	      (t (echo "Please enter reboot, shutdown, or quit."))))))
