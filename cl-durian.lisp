;(load #P"/home/javery/quicklisp/setup.lisp")

(in-package :cl-durian)

; used to force tags to lowercase for convenience
(defvar *force-tags-lowercase* t)

(defparameter entity-map
  (let ((h (make-hash-table :test #'equal)))
    (prog1
      h
      (map nil (lambda (x)
                 (setf (gethash (car x) h) (format nil "&~a;" (cadr x))))
`((,(aref "\"" 0) "quot")(,(aref "&" 0) "amp")(,(aref "'" 0) "apos")(,(aref "<" 0) "lt")
(,(aref ">" 0) "gt")(,(aref " " 0) "nbsp")(,(aref "¡" 0) "iexcl")(,(aref "¢" 0) "cent")
(,(aref "£" 0) "pound")(,(aref "¤" 0) "curren")(,(aref "¥" 0) "yen")(,(aref "¦" 0) "brvbar")
(,(aref "§" 0) "sect")(,(aref "¨" 0) "uml")(,(aref "©" 0) "copy")(,(aref "ª" 0) "ordf")
(,(aref "«" 0) "laquo")(,(aref "¬" 0) "not")(,(code-char 173) "shy")(,(aref "®" 0) "reg")
(,(aref "¯" 0) "macr")(,(aref "°" 0) "deg")(,(aref "±" 0) "plusmn")(,(aref "²" 0) "sup2")
(,(aref "³" 0) "sup3")(,(aref "´" 0) "acute")(,(aref "µ" 0) "micro")(,(aref "¶" 0) "para")
(,(aref "·" 0) "middot")(,(aref "¸" 0) "cedil")(,(aref "¹" 0) "sup1")(,(aref "º" 0) "ordm")
(,(aref "»" 0) "raquo")(,(aref "¼" 0) "frac14")(,(aref "½" 0) "frac12")(,(aref "¾" 0) "frac34")
(,(aref "¿" 0) "iquest")(,(aref "À" 0) "Agrave")(,(aref "Á" 0) "Aacute")(,(aref "Â" 0) "Acirc")
(,(aref "Ã" 0) "Atilde")(,(aref "Ä" 0) "Auml")(,(aref "Å" 0) "Aring")(,(aref "Æ" 0) "AElig")
(,(aref "Ç" 0) "Ccedil")(,(aref "È" 0) "Egrave")(,(aref "É" 0) "Eacute")(,(aref "Ê" 0) "Ecirc")
(,(aref "Ë" 0) "Euml")(,(aref "Ì" 0) "Igrave")(,(aref "Í" 0) "Iacute")(,(aref "Î" 0) "Icirc")
(,(aref "Ï" 0) "Iuml")(,(aref "Ð" 0) "ETH")(,(aref "Ñ" 0) "Ntilde")(,(aref "Ò" 0) "Ograve")
(,(aref "Ó" 0) "Oacute")(,(aref "Ô" 0) "Ocirc")(,(aref "Õ" 0) "Otilde")(,(aref "Ö" 0) "Ouml")
(,(aref "×" 0) "times")(,(aref "Ø" 0) "Oslash")(,(aref "Ù" 0) "Ugrave")(,(aref "Ú" 0) "Uacute")
(,(aref "Û" 0) "Ucirc")(,(aref "Ü" 0) "Uuml")(,(aref "Ý" 0) "Yacute")(,(aref "Þ" 0) "THORN")
(,(aref "ß" 0) "szlig")(,(aref "à" 0) "agrave")(,(aref "á" 0) "aacute")(,(aref "â" 0) "acirc")
(,(aref "ã" 0) "atilde")(,(aref "ä" 0) "auml")(,(aref "å" 0) "aring")(,(aref "æ" 0) "aelig")
(,(aref "ç" 0) "ccedil")(,(aref "è" 0) "egrave")(,(aref "é" 0) "eacute")(,(aref "ê" 0) "ecirc")
(,(aref "ë" 0) "euml")(,(aref "ì" 0) "igrave")(,(aref "í" 0) "iacute")(,(aref "î" 0) "icirc")
(,(aref "ï" 0) "iuml")(,(aref "ð" 0) "eth")(,(aref "ñ" 0) "ntilde")(,(aref "ò" 0) "ograve")
(,(aref "ó" 0) "oacute")(,(aref "ô" 0) "ocirc")(,(aref "õ" 0) "otilde")(,(aref "ö" 0) "ouml")
(,(aref "÷" 0) "divide")(,(aref "ø" 0) "oslash")(,(aref "ù" 0) "ugrave")(,(aref "ú" 0) "uacute")
(,(aref "û" 0) "ucirc")(,(aref "ü" 0) "uuml")(,(aref "ý" 0) "yacute")(,(aref "þ" 0) "thorn")
(,(aref "ÿ" 0) "yuml")(,(aref "Œ" 0) "OElig")(,(aref "œ" 0) "oelig")(,(aref "Š" 0) "Scaron")
(,(aref "š" 0) "scaron")(,(aref "Ÿ" 0) "Yuml")(,(aref "ƒ" 0) "fnof")(,(aref "ˆ" 0) "circ")
(,(aref "˜" 0) "tilde")(,(aref "Α" 0) "Alpha")(,(aref "Β" 0) "Beta")(,(aref "Γ" 0) "Gamma")
(,(aref "Δ" 0) "Delta")(,(aref "Ε" 0) "Epsilon")(,(aref "Ζ" 0) "Zeta")(,(aref "Η" 0) "Eta")
(,(aref "Θ" 0) "Theta")(,(aref "Ι" 0) "Iota")(,(aref "Κ" 0) "Kappa")(,(aref "Λ" 0) "Lambda")
(,(aref "Μ" 0) "Mu")(,(aref "Ν" 0) "Nu")(,(aref "Ξ" 0) "Xi")(,(aref "Ο" 0) "Omicron")
(,(aref "Π" 0) "Pi")(,(aref "Ρ" 0) "Rho")(,(aref "Σ" 0) "Sigma")(,(aref "Τ" 0) "Tau")
(,(aref "Υ" 0) "Upsilon")(,(aref "Φ" 0) "Phi")(,(aref "Χ" 0) "Chi")(,(aref "Ψ" 0) "Psi")
(,(aref "Ω" 0) "Omega")(,(aref "α" 0) "alpha")(,(aref "β" 0) "beta")(,(aref "γ" 0) "gamma")
(,(aref "δ" 0) "delta")(,(aref "ε" 0) "epsilon")(,(aref "ζ" 0) "zeta")(,(aref "η" 0) "eta")
(,(aref "θ" 0) "theta")(,(aref "ι" 0) "iota")(,(aref "κ" 0) "kappa")(,(aref "λ" 0) "lambda")
(,(aref "μ" 0) "mu")(,(aref "ν" 0) "nu")(,(aref "ξ" 0) "xi")(,(aref "ο" 0) "omicron")
(,(aref "π" 0) "pi")(,(aref "ρ" 0) "rho")(,(aref "ς" 0) "sigmaf")(,(aref "σ" 0) "sigma")
(,(aref "τ" 0) "tau")(,(aref "υ" 0) "upsilon")(,(aref "φ" 0) "phi")(,(aref "χ" 0) "chi")
(,(aref "ψ" 0) "psi")(,(aref "ω" 0) "omega")(,(aref "ϑ" 0) "thetasym")(,(aref "ϒ" 0) "upsih")
(,(aref "ϖ" 0) "piv")(,(code-char 8194) "ensp")(,(code-char 8195) "emsp")(,(code-char 8201) "thinsp")
(,(code-char 8204) "zwnj")(,(code-char 8205) "zwj")(,(code-char 8206) "lrm")(,(code-char 8207) "rlm")
(,(aref "–" 0) "ndash")(,(aref "—" 0) "mdash")(,(aref "‘" 0) "lsquo")(,(aref "’" 0) "rsquo")
(,(aref "‚" 0) "sbquo")(,(aref "“" 0) "ldquo")(,(aref "”" 0) "rdquo")(,(aref "„" 0) "bdquo")
(,(aref "†" 0) "dagger")(,(aref "‡" 0) "Dagger")(,(aref "•" 0) "bull")(,(aref "…" 0) "hellip")
(,(aref "‰" 0) "permil")(,(aref "′" 0) "prime")(,(aref "″" 0) "Prime")(,(aref "‹" 0) "lsaquo")
(,(aref "›" 0) "rsaquo")(,(aref "‾" 0) "oline")(,(aref "⁄" 0) "frasl")(,(aref "€" 0) "euro")
(,(aref "ℑ" 0) "image")(,(aref "℘" 0) "weierp")(,(aref "ℜ" 0) "real")(,(aref "™" 0) "trade")
(,(aref "ℵ" 0) "alefsym")(,(aref "←" 0) "larr")(,(aref "↑" 0) "uarr")(,(aref "→" 0) "rarr")
(,(aref "↓" 0) "darr")(,(aref "↔" 0) "harr")(,(aref "↵" 0) "crarr")(,(aref "⇐" 0) "lArr")
(,(aref "⇑" 0) "uArr")(,(aref "⇒" 0) "rArr")(,(aref "⇓" 0) "dArr")(,(aref "⇔" 0) "hArr")
(,(aref "∀" 0) "forall")(,(aref "∂" 0) "part")(,(aref "∃" 0) "exist")(,(aref "∅" 0) "empty")
(,(aref "∇" 0) "nabla")(,(aref "∈" 0) "isin")(,(aref "∉" 0) "notin")(,(aref "∋" 0) "ni")
(,(aref "∏" 0) "prod")(,(aref "∑" 0) "sum")(,(aref "−" 0) "minus")(,(aref "∗" 0) "lowast")
(,(aref "√" 0) "radic")(,(aref "∝" 0) "prop")(,(aref "∞" 0) "infin")(,(aref "∠" 0) "ang")
(,(aref "∧" 0) "and")(,(aref "∨" 0) "or")(,(aref "∩" 0) "cap")(,(aref "∪" 0) "cup")
(,(aref "∫" 0) "int")(,(aref "∴" 0) "there4")(,(aref "∼" 0) "sim")(,(aref "≅" 0) "cong")
(,(aref "≈" 0) "asymp")(,(aref "≠" 0) "ne")(,(aref "≡" 0) "equiv")(,(aref "≤" 0) "le")
(,(aref "≥" 0) "ge")(,(aref "⊂" 0) "sub")(,(aref "⊃" 0) "sup")(,(aref "⊄" 0) "nsub")
(,(aref "⊆" 0) "sube")(,(aref "⊇" 0) "supe")(,(aref "⊕" 0) "oplus")(,(aref "⊗" 0) "otimes")
(,(aref "⊥" 0) "perp")(,(aref "⋅" 0) "sdot")(,(aref "⋮" 0) "vellip")(,(aref "⌈" 0) "lceil")
(,(aref "⌉" 0) "rceil")(,(aref "⌊" 0) "lfloor")(,(aref "⌋" 0) "rfloor")(,(aref "〈" 0) "lang")
(,(aref "〉" 0) "rang")(,(aref "◊" 0) "loz")(,(aref "♠" 0) "spades")(,(aref "♣" 0) "clubs")
(,(aref "♥" 0) "hearts")(,(aref "♦" 0) "diams"))))))


(defun html-escape (text)
  ;; escapes special characters in a string for use
  ;; in HTML
  (with-output-to-string (output)
    (map nil (lambda (c)
               (multiple-value-bind (result success) (gethash c entity-map)
                 (if success
                   (write-string result output)
                   (write-char c output))))
         text)))

(defun html (given)
  ;; transforms a list structure into HTML
  (with-output-to-string (out)
    (labels
      ((inner (given depth)
         (if (listp given)
           (let ((l (length given)))
             (case l (1 (dotimes (d (* 4 depth)) (write-char #\Sp out))
                        (let ((*print-case* (if *force-tags-lowercase*
                                                :downcase
                                                *print-case*)))
                          (format out "<~a></~a>~%" (car given) (car given))))
                     (2 (if (eq (car given) 'raw)
                          (format out "~a" (cadr given))
                          (progn
                            (dotimes (d (* 4 depth)) (write-char #\Sp out))
                            (let ((*print-case* (if *force-tags-lowercase*
                                                    :downcase
                                                    *print-case*)))
                              (format out "<~a>" (car given)))
                            (if (and (listp (cadr given)) (listp (caadr given)))
                              (progn
                                (format out "~%")
                                (map 'nil (lambda (x) (inner x (+ 1 depth))) (cadr given))
                                (dotimes (d (* 4 depth)) (write-char #\Sp out)))
                              (if (member (car given) '(script))
                                (format out "~a" (cadr given))
                                (if (listp (cadr given))
                                  (progn
                                    (format out "~%")
                                    (inner (cadr given) (+ 1 depth))
                                    (dotimes (d (* 4 depth)) (write-char #\Sp out)))
                                  (inner (cadr given) (+ 1 depth)))))
                            (let ((*print-case* (if *force-tags-lowercase*
                                                    :downcase
                                                    *print-case*)))
                              (format out "</~a>~%" (car given))))))
                     (3 (dotimes (d (* 4 depth)) (write-char #\Sp out))
                        (let ((*print-case* (if *force-tags-lowercase*
                                                :downcase
                                                *print-case*)))
                          (format out "<~a" (car given)))
                        (format out "~{ ~{~a=\"~a\"~}~}" (cadr given))
                        (if (and (listp (caddr given)) (listp (caaddr given)))
                          (progn
                            (write-char #\> out)
                            (format out "~%")
                            (map 'nil (lambda (x) (inner x (+ 1 depth))) (caddr given))
                            (dotimes (d (* 4 depth)) (write-char #\Sp out)))
                          (progn
                            (write-char #\> out)
                            (if (member (car given) '(script))
                              (format out "~a" (caddr given))
                              (if (listp (caddr given))
                                (progn
                                  (format out "~%")
                                  (inner (caddr given) (+ 1 depth))
                                  (dotimes (d (* 4 depth)) (write-char #\Sp out)))
                                (inner (caddr given) (+ 1 depth))))))
                        (let ((*print-case* (if *force-tags-lowercase*
                                                :downcase
                                                *print-case*)))
                          (format out "</~a>~%" (car given))))
                     (otherwise (error "list of unhandled length in cl-durian:html"))))
           (format out (html-escape (format nil "~a" given))))))
      (inner given 0))))
