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

;; set
up ido mode for flex matching
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
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 2.0)))))
    ))
