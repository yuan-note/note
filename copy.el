(defun my-insert-buffer (buffer)
  "imple my insert buffer function"
  (interactive "*b select insert buffer")
  (or (bufferp buffer) (setq buffer (get-buffer buffer)))
  (let (start end newmark)
    (save-excursion
      (save-excursion
        (set-buffer buffer)
        (setq start (point-min) end (point-max)))
      (insert-buffer-substring buffer start end)
      (setq newmark (point)))
    (push-mark newmark)))


(defun my-beginning-of-buffer (&optional arg)
  (interactive "P")
  (push-mark (point))
  (goto-char (if arg
                 (/ (* (point-max) (prefix-numeric-value arg)) 10)
               (point-min))))

;; 以上是有问题的

(defun my-buffer-top (&optional arg)
  (interactive "P")
  (goto-char (if arg
                 (if (> (buffer-size) 10000)
                     (* arg (/ (buffer-size) 10))
                   (/ (* (buffer-size) (prefix-numeric-value arg)) 10))
               (point-min)))
  (if arg (forward-line 1)))
