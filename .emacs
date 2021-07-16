(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (py-autopep8 flycheck better-defaults yasnippet-snippets find-file-in-project elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:background "DodgerBlue4" :foreground "wheat"))))
 '(company-preview-common ((t (:inherit company-preview :foreground "seashell2"))))
 '(company-scrollbar-bg ((t (:background "midnight blue"))))
 '(company-scrollbar-fg ((t (:background "cornflower blue"))))
 '(company-tooltip ((t (:background "RoyalBlue4" :foreground "white"))))
 '(company-tooltip-annotation ((t (:foreground "cornflower blue"))))
 '(company-tooltip-common ((t (:foreground "gray"))))
 '(company-tooltip-selection ((t (:background "RoyalBlue3")))))

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(
    better-defaults                 ;; Set up some better Emacs defaults
    elpy                            ;; Python environment
    flycheck                        ;; on the fly syntax checking
    py-autopep8                    ;; pep8 autoformat on save
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message

;; Enable line numbers globally
(global-linum-mode t)

;;set column numbers to be always on
(setq column-number-mode t)

;; disable vertical highlighting guides
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autoformat to pep8 on save (C-x C-s)
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-format-code nil t)))

(setq case-fold-search nil) ; make searches case sensitive

;; print with GUI
(setq lpr-command "gtklp")
(setq ps-lpr-command "gtklp")
;; User-Defined init.el ends here
