(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
(add-hook 'csharp-mode-hook
          (lambda ()
            (local-set-key (kbd "{") 'c-electric-brace)))
(provide 'init-csharp-mode)
