;;; init-common.el --- common settings

;; Save the cursor posision
(require 'saveplace)
(setq-default save-place t)
(setq server-visit-hook 'save-place-find-file-hook)

;; Use space instead of tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Scroll Smoothly
(setq redisplay-dont-pause t)
(setq scroll-margin 9)
(setq scroll-conservatively 1000)

;; Change the size of a font for the current frame
(my:resize-frame-font-size (selected-frame))
(add-hook 'after-make-frame-functions 'my:resize-frame-font-size)

;; Display column number
(column-number-mode t)

;; Show Paren Mode
(show-paren-mode t)

;; Hilight current line
(global-hl-line-mode t)

;; case-fold-search must be t or org-babel-tangle will not work
;; (setq-default case-fold-search t)

;; Auto Revert Mode
(global-auto-revert-mode t)

;; Auto save
(setq auto-save-interval 5
      auto-save-timeout 3)

;; Make "M-x shell-command" read rc file
(setq shell-command-switch "-ic")

;; Use shift+{left,up,down,right} to switch between windows
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Make '_' a word character
(add-hook 'sh-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" sh-mode-syntax-table)))
(add-hook 'perl-mode-hook
          (lambda () (modify-syntax-entry ?_ "w" perl-mode-syntax-table)))

;; Autopairing
(electric-pair-mode t)

;; bind isearch-forward-regexp to "C-s"
;; bind isearch-backward-regexp to "C-S-s"
(define-key global-map (kbd "C-s") 'isearch-forward-regexp)
(define-key global-map (kbd "C-S-s") 'isearch-backward-regexp)
(define-key isearch-mode-map (kbd "C-S-s") 'isearch-repeat-backward)

;; org-mode
;; open url with "xdg-open"
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program (my:generic-open-command))

;; bison mode
(require 'bison-mode)

;; flex mode
(require 'flex-mode)

;; which function mode
(which-function-mode t)
;; (eval-after-load "which-function"
;;   '(setq which-func-modes '(c-mode c++-mode python-mode)))
(setq which-func-modes '(c-mode c++-mode python-mode))

;; make speedbar support golang
(add-hook 'speedbar-load-hook
          (lambda ()
            (speedbar-add-supported-extension "go")))

(if (display-graphic-p)
    (progn
      ;; Disable toolbar
      (tool-bar-mode 0)
      ;; scroll-bar
      (set-scroll-bar-mode 'left)
      (set-face-foreground 'scroll-bar "#f2f1f0")
      (set-face-background 'scroll-bar "#4c4c4c")
      ))

;; use regexp search
(setq isearch-regexp t)

;; set font to ubuntu mono
;; (set-frame-font "ubuntu mono")

(provide 'init-common)
