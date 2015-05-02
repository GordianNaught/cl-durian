# cl-durian
cl-durian creates human legible, indented HTML from simple list structures.
```
(cl-durian:html `(html ((h1 "This is the title") (b ((p "line1")(p "line2"))))))

"<html>
    <h1>This&nbsp;is&nbsp;the&nbsp;title</h1>
    <b>
        <p>line1</p>
        <p>line2</p>
    </b>
</html>
"
```
# Dictionary
### html
`html' takes a list structure and creates a formatted html string. This is the main function of cl-durian.
### *force-tags-lowercase*
defaults to *t* (true)
This forces all tags to lowercase. It can be changed, but it defaults to *t* for convenience as symbols are naturally read in all caps by the lisp reader.
### html-escape
escapes a string for use in html (not generally needed, cl-durian handles the escaping of strings automatically).
### script
This symbol denotes that a script follows. Scripts are unescaped.
### raw
This is a symbol used by the package to denote that the text in the given list is untagged and needs no escaping.
