(defvar gaeunit-tests-success-hook nil
  "Hook called when all GAEUnit tests succeed")

(defvar gaeunit-tests-failure-hook nil
  "Hook called when one or more GAEUnit tests fail")

(defun gaeunit-run-tests ()
  (interactive)
  (call-process "gaeunit" nil "*gaeunit*" nil)
  (save-current-buffer
    (switch-to-buffer "*gaeunit*" t)

    (let ((buffer-contents (buffer-string)))
      (run-hooks
       (if (string-match-p "^OK$" buffer-contents)
          'gaeunit-tests-success-hook
          'gaeunit-tests-failure-hook)))))

(defvar gaeunit-mode-map (make-sparse-keymap)
  "gaeunit-mode keymap")

(define-minor-mode gaeunit-mode
  "GAEUnit mode"
  nil
  "GAEUnit"
  gaeunit-mode-map)
