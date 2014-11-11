;; init.el --- Emacs configuration entry point
;;
;; Copyright (c) 2013 John Anderson ( sontek )
;;
;; Author: John Anderson < sontek@gmail.com >
;; URL: http://sontek.net

;;; Commentary:
;; This file is not part of GNU Emacs.  It is the personal configuration
;; for John Anderson.

;;; Code:
(defvar current-user
      (getenv
       (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "sontek-mode is powering up... Be patient, Young Padawan %s!" current-user)

(when (version< emacs-version "24.1")
  (error "sontek-mode requires at least GNU Emacs 24.1, but you're running %s" emacs-version))


;; Setup the directory structure
(defvar sontek-dir (file-name-directory load-file-name)
  "The root dir of the sontek-mode distribution.")
(defvar sontek-core-dir (expand-file-name "core" sontek-dir)
  "The home of sontek-mode's core functionality.")
(defvar sontek-vendor-dir (expand-file-name "vendor" sontek-dir)
  "This directory houses packages that are not yet available in ELPA (or MELPA).")
(defvar sontek-savefile-dir (expand-file-name "savefile" sontek-dir)
  "This folder stores all the automatically generated save/history-files.")

;; add sontek-mode's directories to Emacs's `load-path`
(add-to-list 'load-path sontek-core-dir)
(add-to-list 'load-path sontek-vendor-dir)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(require 'sontek-packages)
(require 'sontek-editor)
(require 'sontek-ui)

(message "sontek-mode is ready to do thy bidding, Happy Hacking %s!" current-user)

;;; init.el ends here
;(require 'package)

;(add-to-list 'package-archives
 ; '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(add-to-list 'package-archives
 ;   '("marmalade" .
 ;     "http://marmalade-repo.org/packages/"))

;(package-initialize)

; turn off start-up screen
;(setq inhibit-startup-message t)

; turn on paren match highlighting
;(show-paren-mode 1)

; highlight entire bracket expression
;(setq show-paren-style 'expression)

; display line numbers in margin
;(global-linum-mode 1)

; display the column and line our cursor is on
;(column-number-mode 1)

; stop creating those backup~ files
;(setq make-backup-files nil)

; stop creating those #autosave# files
;(setq auto-save-default nil)

; highlight the current line we are editing
;(global-hl-line-mode 1)

; disable the toolbar
;(tool-bar-mode -1)

; disable the menubar
;(menu-bar-mode -1)

; default tabs as 2 spaces, python as 4
;(setq-default indent-tabs-mode 2)
;(setq python-indent-offset 4)

;(require 'web-mode)

; Enable web-mode
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

; Add autopair from web-mode
;(setq web-mode-extra-auto-pairs
 ;     '(("erb"  . (("open" "close")))
  ;                 ("open" "close")
   ;     ))
;(setq web-mode-enable-auto-pairing t)
