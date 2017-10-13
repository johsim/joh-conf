(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Default packages
(setq package-list '(anaconda-mode f dash s pythonic clang-format elpy pyvenv find-file-in-project swiper company flycheck let-alist pkg-info epl htmlize auto-complete popup python-environment deferred epc ctable concurrent let-alist pkg-info epl py-isort pylint pytest python-mode pythonic window-margin yasnippet yaml-mode markdown-mode groovy-mode dired-toggle-sudo dockerfile-mode highlight-indent-guides json-mode simpleclip js2-mode rjsx-mode terraform-mode))

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

;; Groovy mode for Jenkinsfile
(require 'groovy-mode)
(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))

;; Yaml for templates
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml.j2\\'" . yaml-mode))

;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; JSX
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook (lambda () (setq js2-basic-offset 2)))
(setq js2-strict-missing-semi-warning nil)

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

(global-set-key (kbd "C-c <right>") 'hs-show-block)
(global-set-key (kbd "C-c <left>")  'hs-hide-block)
(global-set-key (kbd "C-c <up>")    'hs-hide-all)
(global-set-key (kbd "C-c <down>")  'hs-show-all)
(add-hook 'prog-mode-hook #'hs-minor-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; No tabs
(setq-default indent-tabs-mode nil)

;; No auto indent
(setq electric-indent-mode nil)

;; Highlight intendation
(add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
(add-hook 'yaml-mode-hook #'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;; Display Column number
(setq column-number-mode t)

(setq org-todo-keyword-faces
      '(("IN-PROGRESS" . "yellow")
	("WAITING" . "orange")
	("UPCOMING" . "deep sky blue")
	("DONE" . "green")
	("NOTES" . "magenta")
	))

;; Set show matching parenthesis
(show-paren-mode 'on)

;;Stylesheet
(setq org-export-html-style-include-scripts nil
      org-export-html-style-include-default nil)

(setq org-export-html-style
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"orgstyle.css\" />")

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Enable simpleclip
(require 'simpleclip)
(simpleclip-mode 1)

;; enable clipboard in emacs
;; (setq x-select-enable-clipboard f)

;; disable tilde backup files
(setq make-backup-files nil)
