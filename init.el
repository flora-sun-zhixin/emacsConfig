(setq inhibit-startup-message t)

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

;; 
(use-package which-key
  :ensure t
  :config (which-key-mode))



