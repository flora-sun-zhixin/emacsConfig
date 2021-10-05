(setq inhibit-startup-message t)
;; hide the tool bar of emacs
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; key binding
;; claim the key use for macbook
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta ; disable Option's function for non-ASCII characters
      mac-option-modifier 'none)

;; help temporily try the packages
;; M-x try RET package-name, then M-x package-name to run it
(use-package try
  :ensure t)

;; helps to remind the shortcut
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff ------------------------------
;; word wrap in org mode, although might make table looks ugly
(setq org-startup-truncated nil)

;; make the list in org files looks nicer
(use-package org-bullets
  :ensure t               ;; insure that it is installed
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode)) ;; from the homepage

;; set up ido mode for flex matching
(setq ido-enable-flex-matching t) ;; enable not exact match
(setq ido-everywhere t)           ;; enable ido matching everywhere
(ido-mode 1)

;; change the bufferlist to ibuffer mode so can kill multiple buffer at one time
(defalias 'list-buffers 'ibuffer-other-window)

;; helps to jump between windows when there are multiple 
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    ;; change the fontsize of the number pop up for each windows
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 2.0)))))
    ))
;; Ivy mode for auto-completion and flex searching
(use-package counsel
  :ensure t
  :config
  (setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))
  )
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)              ;; C-s will be swiper now
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
   ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel swiper which-key web-mode use-package try pdf-tools org-bullets markdown-preview-eww ipython-shell-send flymake-python-pyflakes flycheck elpy ein ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
