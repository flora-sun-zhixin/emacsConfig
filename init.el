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
      mac-command-modifier 'meta ;; disable Option's function for non-ASCII characters
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

;; using swiper so ido no longer needed
;; set up ido mode for flex matching
;; (setq ido-enable-flex-matching t) ;; enable not exact match
;; (setq ido-everywhere t)           ;; enable ido matching everywhere
;; (ido-mode 1)

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
         "\\(?:\\`[#.].*\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))
  )
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind(("C-x b" . ivy-switch-buffer))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    ))
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)     ;; now the default search will be swiper
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f". counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (setq enable-recursive-minibuffers t)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
   ))

;; avy - search for chars to navigate quickly
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; auto complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    (set-face-background 'ac-candidate-face "SlateGray1")
    (set-face-background 'ac-selection-face "RoyalBlue3")
    (add-to-list 'ac-modes 'org-mode)
    ))

;; load the theme
(load-theme 'deeper-blue t)
