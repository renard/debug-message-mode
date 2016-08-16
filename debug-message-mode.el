;;; debug-message-mode.el --- Simple debug message mode

;; Copyright © 2016 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>

;; Author: Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
;; Keywords: emacs, 
;; Created: 2016-08-16
;; Last changed: 2016-08-16 11:38:45
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/

;; This file is NOT part of GNU Emacs.

;;; Commentary:
;; 
;; Simple mode to display debug buffer in read only and allow to quit when
;; hitting the `q` key.

;;; Code:


(defvar debug-message-mode-map
  (let ((map (make-sparse-keymap "Debug")))
    (define-key map (kbd "q") 'kill-debug-message-buffer)
    map)
  "Keymap for `debug-message-mode'.")

(defun kill-debug-message-buffer()
  (interactive)
  (kill-buffer (current-buffer)))


;;;###autoload
(define-minor-mode debug-message-mode
  "Display file log information inline."
  :keymap debug-message-mode-map
  :lighter " Debug"

  (if debug-message-mode
      (progn
        (set-buffer-modified-p nil)
        (setq buffer-read-only t))
    (set-buffer-modified-p nil)))


(provide 'debug-message-mode)

;; debug-message-mode.el ends here
