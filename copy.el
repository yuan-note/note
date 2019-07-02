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
