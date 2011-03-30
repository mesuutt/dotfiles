;; don't create backups
(setq make-backup-files nil)

;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Disable emacs splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Enable Python Mode
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; Make Text mode the default mode for new buffers
(setq-default major-mode 'text-mode)

;; Environment
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; show both column and line numbers
(setq column-number-mode t)
(menu-bar-mode nil)

;; Indentation
(setq standart-indent 4)
(setq-default indent-tabs-mode nil)

;; Remove White Spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Keybindings
(global-set-key "\C-l" 'goto-line)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
