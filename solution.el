;; -*- lexical-binding: t; -*-

;; See
;;
;; http://xahlee.info/emacs/emacs/elisp_read_file_content.html

(defun convert-to-number-list (chunk)
  "Convert a newline tokenized list of numerical strings into a
list of numbers."
  (mapcar #'string-to-number (split-string chunk)))

(defun sum-list (lst)
  (reduce #'+ lst))

(defun solve ()
  (with-temp-buffer
    (insert-file-contents "input.txt")
    (let* ((file-contents (buffer-string))
	   (elf-groups (split-string file-contents "\n\n" t))
	   (elf-list (mapcar #'convert-to-number-list elf-groups))
	   (elf-sums (mapcar #'sum-list elf-list))
	   (sorted (seq-sort #'> elf-sums)))
      (sum-list (cl-loop for i from 0 to 2 collect (nth i sorted))))))

(solve)
