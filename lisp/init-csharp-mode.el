(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(defun my-csharp-common-mode-fn ()
  (local-set-key (kbd "{") 'c-electric-brace)
  (when (and *is-a-mac* (executable-find "xbuild"))
    (custom-set-variables '(csharp-msbuild-tool "xbuild")))
  (local-set-key "\C-x\C-e"  (lambda () (interactive) (compile csharp-msbuild-tool))))

(add-hook 'csharp-mode-hook 'my-csharp-common-mode-fn)

(provide 'init-csharp-mode)
