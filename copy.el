(setq oldbuf (current-buffer))

(defun mytest (buffer)
  (interactive "BAppend to buffer:")    ;将选中的 buffer的name 传给 buffer变量
  (set-buffer (get-buffer-create buffer))
  (message "hello word %s" (current-buffer))
  (insert-buffer-substring oldbuf))

(mytest)

(defun mytest2 (buffer start end)
  (interactive "BAppend to buffer: \nr") ; \n 将形参分成两个部分，第一部分放在buffer变量中,第二部分就是 "r"。"r" 代表 (start 和 end) 绑定到位点和标记值上。
  (set-buffer (get-buffer-create buffer))
  (message "hello word %s" (current-buffer))
  (insert-buffer-substring oldbuf start end))

(defun my-append-to-buffer (buffer begin end)
  "实现一个 append-to-buffer 函数"
  (interactive "BAppend to buffer: \nr")
  (let ((oldbuf (current-buffer)))
    (save-excursion
      (set-buffer (get-buffer-create buffer))
      (insert-buffer-substring oldbuf begin end))))
