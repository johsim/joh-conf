(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; set default font size:
(set-face-attribute 'default nil :height 89)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)



;; So that emacs don't complain about the wrong encoding.
(define-coding-system-alias 'UTF-8 'utf-8)

;;initalize ido-mode
(require 'ido)
(ido-mode t)

;; no startup msg  
(setq inhibit-startup-message t)        ; Disable startup message 

;;Key-bindings:
(global-set-key (kbd "M-o") (quote hippie-expand))
;;(global-set-key (kbd "\C-o") 'python-completion-complete-at-point)
(global-set-key [15] (quote python-shell-completion-complete-or-indent))
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)   

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; Display Column number
(setq column-number-mode t)

(setq org-todo-keyword-faces
      '(("IN-PROGRESS" . "yellow")
	("WAITING" . "orange")
	("UPCOMING" . "deep sky blue")
	("DONE" . "green")
	))

