; disable beep when scroll limit
; http://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
; turns off auto-save
(setq auto-save-default nil)

(global-set-key "\M-s" 'save-buffer)

; evil-key-binding
; https://github.com/mbriggs/.emacs.d/blob/master/init/init-keymaps.el
(evil-define-key 'normal global-map
  (kbd "M-<backspace>") 'kill-whole-line
  (kbd "M-v") 'yank)

(evil-define-key 'insert global-map
  (kbd "M-J") 'evil-join
  (kbd "M-v") 'yank
  (kbd "M-S-<return>") 'evil-open-above
  (kbd "M-<return>") 'evil-open-below)

(provide 'init-misc-my)
