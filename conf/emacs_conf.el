;; Default packages
(setq package-list '(anaconda-mode f dash s pythonic elpy pyvenv find-file-in-project swiper company flycheck let-alist pkg-info epl htmlize auto-complete popup python-environment deferred epc ctable concurrent let-alist pkg-info epl py-isort pylint pytest python-mode window-margin yasnippet yaml-mode markdown-mode groovy-mode dired-toggle-sudo dockerfile-mode json-mode simpleclip js2-mode rjsx-mode terraform-mode use-package ivy counsel smart-mode-line atom-one-dark-theme jedi))

;; Set package archives
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://stable.melpa.org/packages/")))

;; Activate all the packages (in particular autoloads)
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

;; Smart mode line
(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(if (not window-system)
    (defvar atom-one-dark-colors-alist
      '(("atom-one-dark-accent"   . "#528BFF")
        ("atom-one-dark-fg"       . "#d7dbe2")
        ("atom-one-dark-bg"       . "gray14")
        ("atom-one-dark-bg-1"     . "gray13")
        ("atom-one-dark-bg-hl"    . "gray13")
        ("atom-one-dark-gutter"   . "#666D7A")
        ("atom-one-dark-accent"   . "#AEB9F5")
        ("atom-one-dark-mono-1"   . "#ABB2BF")
        ("atom-one-dark-mono-2"   . "#828997")
        ("atom-one-dark-mono-3"   . "#5C6370")
        ("atom-one-dark-cyan"     . "#56B6C2")
        ("atom-one-dark-blue"     . "#61AFEF")
        ("atom-one-dark-purple"   . "#C678DD")
        ("atom-one-dark-green"    . "#98C379")
        ("atom-one-dark-red-1"    . "#E06C75")
        ("atom-one-dark-red-2"    . "#BE5046")
        ("atom-one-dark-orange-1" . "#D19A66")
        ("atom-one-dark-orange-2" . "#E5C07B")
        ("atom-one-dark-gray"     . "#3E4451")
        ("atom-one-dark-silver"   . "#AAAAAA")
        ("atom-one-dark-black"    . "#0F1011"))
      "List of Atom One Dark colors.")
  )
(load-theme 'atom-one-dark t)

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

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-height 5)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(setq inhibit-startup-message t)

;; Python
(elpy-enable)
(setq elpy-rpc-backend "jedi")


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

;; Whitespace cleanup
(add-hook 'before-save-hook 'whitespace-cleanup)
