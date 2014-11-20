(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(custom-set-variables '(csharp-msbuild-tool "xbuild"))

(defun my-csharp-common-mode-fn ()
  (local-set-key (kbd "{") 'c-electric-brace))

(add-hook 'csharp-mode-hook 'my-csharp-common-mode-fn)
(provide 'init-csharp-mode)
