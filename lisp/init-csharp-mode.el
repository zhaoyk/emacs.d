(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(defun prepare-csharp-run-code () (interactive)
  (lexical-let ((cur-buf (current-buffer)))
    (setq run-csharp-code
          (lambda (combuf msg)
            (with-current-buffer combuf
              (let ((inhibit-read-only t))
                (insert "-------------------output--------------------\n")
                (with-current-buffer cur-buf
                  (call-process "mono" nil combuf nil "bin/Debug/name.exe"))
                (setq compilation-finish-functions (delq run-csharp-code compilation-finish-functions))))))
    (push run-csharp-code compilation-finish-functions)))


(defun my-csharp-common-mode-fn ()
  (local-set-key (kbd "{") 'c-electric-brace)
  (when (and *is-a-mac* (executable-find "xbuild"))
    (custom-set-variables '(csharp-msbuild-tool "xbuild")))
  (local-set-key "\C-x\C-e" (lambda () (interactive) (compile csharp-msbuild-tool)))
  (local-set-key "\C-x\C-r" (lambda () (interactive)
                              (prepare-csharp-run-code)
                              (compile csharp-msbuild-tool))))

(add-hook 'csharp-mode-hook 'my-csharp-common-mode-fn)

(provide 'init-csharp-mode)
