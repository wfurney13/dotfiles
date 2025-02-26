;function calls
(menu-bar-mode -1)

(scroll-bar-mode -1)

(tool-bar-mode -1)

(global-display-line-numbers-mode)

;variable sets
(setq visible-bell 1)

(setq inhibit-startup-screen t)

(setq compilation-ask-about-save nil)

;keybinds
(global-unset-key (kbd "C-x C-c"))

(global-set-key [f4] 'compile)


; udfs
(lambda (file)
    (y-or-n-p (format "Really delete %s? " file)))

;;; system generated ;;;

;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(display-line-numbers-type 'visual)
 '(package-selected-packages '(gruber-darker-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
