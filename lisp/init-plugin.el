;;; init-plugin.el --- common plugins
;;; Commentary:
;;; Code:

;;; Theme
;(require-package 'color-theme-sanityinc-tomorrow)
;(require 'color-theme-sanityinc-tomorrow)
;(load-theme 'sanityinc-tomorrow-night t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night t)
  )


;;; Anzu
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode t)
  )


;;; company-mode - Modular in-buffer completion framework
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;; (setq company-dabbrev-downcase nil)
  ;;; remove annoying blinking
  ;;(setq company-echo-delay 0)
  )


;;; complete c/c++ headers
(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  )


;;; Highlight Indentation
(use-package highlight-indentation
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'xml-mode-hook 'highlight-indentation-mode)
  (add-hook 'nxml-mode-hook 'highlight-indentation-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-mode)
  )

;;; Uniquify - Making buffer names unique
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward)
  )



;;; Flycheck - Modern on the fly syntax checking
;; Quick start : http://www.flycheck.org/manual/latest/Quickstart.html
;; Install ShellCheck https://github.com/koalaman/shellcheck/releases
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  )


;;; Markdown mode
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" markdown-mode-syntax-table)))
  )

;;; adoc-mode
(use-package adoc-mode
  :ensure t
  :mode "\\.adoc\\'"
  :config
  (add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))
  )

;;; lua-mode
(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'"
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (add-hook 'lua-mode-hook
            (lambda () (modify-syntax-entry ?_ "w" lua-mode-syntax-table)))
  (setq lua-indent-level 4)
  )

;;; cmake-mode
(use-package cmake-mode
  :ensure t
  )

;;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  )

;;; avy-mode
(use-package avy
  :ensure t
  )

;;; window-numbering
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode t)
  )

;;; lemon-mode
(require-package 'lemon-mode)

;;; yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs
      (list (expand-file-name "snippets/snippets" user-emacs-directory)))
(yas-global-mode 1)


;;; expand-region
(require-package 'expand-region)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;; clang-format
(require-package 'clang-format)
(require 'clang-format)
(setq-default clang-format-style "{IndentWidth: 4}")


;;; yaml-mode
(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'"
  :config
  (lambda () (modify-syntax-entry ?_ "w" yaml-mode-syntax-table))
  )


;;; fic-mode
(require-package 'fic-mode)


;;; dockerfile-mode
(require-package 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;;; counsel swiper and ivy
(require-package 'swiper)
(require-package 'counsel)
;; (ivy-mode t)


;;; exec-path-from-shell
(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")


;;; nginx-mode
(require-package 'nginx-mode)


;;; plantuml-mode
;; (require-package 'plantuml-mode)
(require 'plantuml-mode)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))


;;; web-mode
(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  ;;(add-hook 'web-mode-hook (lambda () (setq web-mode-markup-indent-offset 2)))
  )

;;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  )

;;; racket-mode
; too slow
;(use-package racket-mode
;  :ensure t
;  )

(use-package scheme-mode
  :mode "\\.rkt\\'"
  )

(provide 'init-plugin)
;;; init-plugin.el ends here
