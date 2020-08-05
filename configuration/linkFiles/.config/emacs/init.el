(require 'package)

;; optional. makes unpure packages archives unavailable
(setq package-archives nil)

(setq package-enable-at-startup nil)
(package-initialize)
(eval-when-compile
  (require 'use-package))

(use-package org
	:config
	(use-package evil-org
		:hook (org-mode . evil-org-mode)
		:init
		(setq org-agenda-files '("~/Agenda/"))
		:config
		(evil-org-set-key-theme '(navigation textobjects todo calendar))))

(use-package evil
	:config
	(evil-mode))

(use-package gruvbox-theme
	     :config
	     (load-theme 'gruvbox-dark-medium t))

; Start server to use in conjunction with emacsclient
(server-start)
