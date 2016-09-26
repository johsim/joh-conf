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

;; Default packages
(setq package-list '(anaconda-mode f dash s s dash pythonic f dash s s dash clang-format elpy yasnippet pyvenv highlight-indentation find-file-in-project swiper company find-file-in-project swiper flycheck let-alist pkg-info epl dash highlight-indentation htmlize auto-complete popup python-environment deferred epc ctable concurrent deferred python-environment deferred epc ctable concurrent deferred let-alist pkg-info epl popup py-isort pylint pytest python-environment deferred python-mode pythonic f dash s s dash pyvenv s swiper window-margin yasnippet yaml-mode markdown-mode groovy-mode))

;; Set package archives
(require 'package) 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))



;; Activate all the packages (in particular autoloads)
(package-initialize)

;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; set default font size:
(set-face-attribute 'default nil :height 89)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Yaml for templates
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml.j2\\'" . yaml-mode))

;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; So that emacs don't complain about the wrong encoding.
(define-coding-system-alias 'UTF-8 'utf-8)

;;initalize ido-mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; no startup msg  
(setq inhibit-startup-message t)       

;;Key-bindings:
(global-set-key (kbd "M-o") (quote hippie-expand))
;;(global-set-key (kbd "\C-o") 'python-completion-complete-at-point)
(global-set-key [15] (quote python-shell-completion-complete-or-indent))
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)

(add-hook 'after-init-hook #'global-flycheck-mode)

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
	("NOTES" . "magenta")
	))


;;Stylesheet

(setq org-export-html-style-include-scripts nil
      org-export-html-style-include-default nil)

(setq org-export-html-style
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"orgstyle.css\" />")
