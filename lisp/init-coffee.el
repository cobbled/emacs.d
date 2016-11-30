(require-package 'coffee-mode)

;; set tab width to 2
(custom-set-variables '(coffee-tab-width 2))

;; enable highlight indentation and flycheck
(add-hook 'coffee-mode-hook 'highlight-indentation-mode)
(add-hook 'coffee-mode-hook 'flycheck-mode)

;; Insert appropriate number of coffee-tab-with according to
;; coffee-previous-indent and coffee-line-wants-indent.
(defun my:coffee-indent-line ()
  (interactive)

  (back-to-indentation)
  (let ((prev-indent (coffee-previous-indent)))

    (coffee-insert-spaces prev-indent)
    (if (coffee-line-wants-indent)
        (progn
          (coffee-insert-spaces coffee-tab-width)
          (back-to-indentation)))

    ;; We're too far, remove all indentation.
    (when (> (- (current-indentation) prev-indent) coffee-tab-width)
      (backward-to-indentation 0)
      (delete-region (point-at-bol) (point)))))

;; The original coffee-indent-line function could not work well with
;; evil-mode.
;;
;; Use my:coffee-indent-line function instead of the original
;; coffee-indent-line function.
(defun my:coffee-mode-hook ()
  (set (make-local-variable 'indent-line-function) 'my:coffee-indent-line))

(add-hook 'coffee-mode-hook 'my:coffee-mode-hook)

(provide 'init-coffee)
