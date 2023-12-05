(require 'package)
(require 'bind-key)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; load the other emacs init code
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "~/anaconda3")
 '(elpy-rpc-python-command "python3")
 '(elpy-syntax-check-command "pyflakes")
 '(explicit-shell-file-name "/bin/zsh")
 '(package-selected-packages
   '(ox-gfm markdown-mode grip-mode peep-dired projectile conda anaconda-mode pyvenv elpy jedi which-key use-package try ox-reveal org-preview-html org-bullets markdown-preview-eww htmlize flymake-python-pyflakes flycheck counsel ace-window))
 '(python-shell-interpreter "python3")
 '(pyvenv-workon "py37")
 '(tramp-default-host "cigserver3.seas.wustl.edu")
 '(tramp-default-method "ssh")
 '(tramp-default-user "zhixin.sun"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
