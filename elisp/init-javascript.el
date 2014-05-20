(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'ac-js2)
(require-package 'coffee-mode)
(require-package 'js-comint)

; Set javascript indents to 2 spaces
(setq js-indent-level 2)

; set js2-mode as major mode for javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; set js2-mode indent
(setq js2-basic-offset 2)

(provide 'init-javascript)
