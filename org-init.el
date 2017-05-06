
(setq user-full-name "Lorenzo M. Iannuzzi"
      user-mail-address "lorenzoi@how2code.io")

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
;(server-start)

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa"     . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; If you Like TabBar Uncommnent Below
(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 1))

(use-package tabbar-ruler
  :ensure t)

(use-package ace-window
  :ensure t
   :config
   (progn
     (global-set-key [remap other-window] 'ace-window)
     (custom-set-faces
        '(aw-leading-char-face
            ((t (:inherit ace-jump-face-foreground :height 1.5)))))
 ))

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s"          'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>")    'ivy-resume)
    (global-set-key (kbd "M-x")     'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f")  'counsel-describe-function)
    (global-set-key (kbd "<f1> v")  'counsel-describe-variable)
    (global-set-key (kbd "<f1> l")  'counsel-load-library)
    (global-set-key (kbd "<f2> i")  'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u")  'counsel-unicode-char)
    (global-set-key (kbd "C-c g")   'counsel-git)
    (global-set-key (kbd "C-c j")   'counsel-git-grep)
    (global-set-key (kbd "C-c k")   'counsel-ag)
    (global-set-key (kbd "C-x l")   'counsel-locate)
    (global-set-key (kbd "C-S-o")   'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package lua-mode
  :ensure t)

(use-package sass-mode
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package rust-mode
        :ensure t)

(use-package perl6-mode
        :ensure t)

(use-package fsharp-mode
        :ensure t)

(use-package rainbow-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.jade\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'"    . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.hjs\\'"      . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'"     . web-mode))
;; Auto-Pairing
(setq web-mode-enable-auto-pairng t)

;; Embeded CSS Highlighting
(setq web-mode-enable-css-colorization t)

;; HTML + ejs + hjs + erb + XML column highlight
;(setq web-mode-enable-current-column-highlight t)

(use-package rainbow-delimiters
  :ensure t)
(rainbow-delimiters-mode t)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package cider
  :ensure t)

(use-package achievements
    :ensure t)
(add-hook 'prog-mode-hook 'achievements-mode)

(use-package autopair
    :ensure t)
(add-hook 'prog-mode-hook 'autopair-mode)

(use-package auto-complete
     :ensure t)

;;(add-hook 'prog-mode-hook 'auto-complete-mode)

(global-linum-mode)
(eval-after-load 'linum
  '(progn
     (defface linum-leading-zero
       `((t :inherit 'linum
            :foreground ,(face-attribute 'linum :background nil t)))
       "Face for displaying leading zeroes for line numbers in display margin."
       :group 'linum)

     (defun linum-format-func (line)
       (let ((w (length
                 (number-to-string (count-lines (point-min) (point-max))))))
         (concat
          (propertize (make-string (- w (length (number-to-string line))) ?0)
                      'face 'linum-leading-zero)
          (propertize (number-to-string line) 'face 'linum))))
   
     (setq linum-format 'linum-format-func)))

 (defvar my-linum-format-string "%4d")
 (add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
 (defun my-linum-get-format-string ()
   (let* ((width (length (number-to-string
                          (count-lines (point-min) (point-max)))))
          (format (concat "%" (number-to-string width) "d")))
     (setq my-linum-format-string format)))
 (setq linum-format 'my-linum-format)
 (defun my-linum-format (line-number)
   (propertize (format my-linum-format-string line-number) 'face 'linum))

(use-package tree-mode
  :ensure t)
(use-package windata
  :ensure t)
(use-package dirtree
  :ensure t)

(use-package org
  :ensure t)

;; Global TODO items

(setq org-todo-keywords
      '((sequence "NEXT" "TODO" "CURRENTLY" "PROJ" | "CANCELLED" "DONE")))

;; Asterisks are Ugly, Org-Bullets Helps.

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere            t)
(ido-mode                       1)
(global-prettify-symbols-mode   t)
;(setq confirm-kill-emacs 'yes-or-no-p)
(defalias 'list-buffer   'ibuffer)
;(linum-relative-global-mode    1)
