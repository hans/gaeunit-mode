(defun gaeunit-run-tests ()
  (interactive)
  (call-process "gaeunit" nil "*gaeunit*" nil))

(defvar gaeunit-mode-map (make-sparse-keymap)
  "gaeunit-mode keymap")

(define-minor-mode gaeunit-mode
  "GAEUnit mode"
  nil
  "GAEUnit"
  gaeunit-mode-map)
