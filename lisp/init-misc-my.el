; disable beep when scroll limit
; http://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)
; 下划线 _ 是单词的一部分(搜索替换时很有用)
(modify-syntax-entry ?_ "w")
; turns off auto-save
(setq auto-save-default nil)
; change frame title: name (path)
(setq-default frame-title-format "%b (%f)")

(global-set-key "\M-c" 'copy-region-as-kill)
(global-set-key "\M-v" 'yank)
(global-set-key "\C-cc" 'ns-copy-including-secondary)
(global-set-key "\C-cv" 'ns-paste-secondary)
(global-set-key "\M-s" 'save-buffer)
(global-set-key "\M-L" 'indent-buffer)
; evil-key-binding
; https://github.com/mbriggs/.emacs.d/blob/master/init/init-keymaps.el
(evil-define-key 'normal global-map
  (kbd "C-y") 'evil-scroll-up)

(evil-define-key 'insert global-map
  (kbd "M-J") 'evil-join
  (kbd "M-<backspace>") 'kill-whole-line
  (kbd "M-h") 'evil-backward-char
  (kbd "M-l") 'evil-forward-char
  (kbd "M-j") 'evil-next-line
  (kbd "M-k") 'evil-previous-line
  (kbd "M-p") 'evil-paste-after
  (kbd "M-P") 'evil-paste-before
  (kbd "M-S-<return>") 'evil-open-above
  (kbd "M-<return>") 'evil-open-below)

(evil-leader/set-key
  "=" '(lambda () (interactive) (diff-buffer-with-file (current-buffer)))
  )
; in macos change helm grep to ggrep
(when (and *is-a-mac* (executable-find "ggrep"))
  (setq helm-grep-default-command "ggrep -a -d skip %e -n%cH -e %p %f"
        helm-grep-default-recurse-command "ggrep -a -d recurse %e -n%cH -e %p %f"))

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(provide 'init-misc-my)
