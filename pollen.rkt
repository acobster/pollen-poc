#lang racket/base
(require pollen/core pollen/tag pollen/template pollen/pagetree pollen/decode txexpr)
(provide (all-defined-out))

;; render an <article> as the root of each post's main content
(define (root . elements)
  `(main
     ,@(decode-elements
         elements
         #:txexpr-elements-proc decode-paragraphs
         #:string-proc (compose1 smart-quotes smart-dashes))))


;; conditional page <title> contents
(define (page-title title)
  (if title
    (string-append title " | Tomato Tomato")
    "Tomato Tomato"))


;; navigation elements
(define (page-link attrs? pagesym)
  (let* ([href (symbol->string pagesym)]
         [attrs (cons `(href ,href) attrs?)])
    `(a (,@attrs)
        ,@(select-from-doc 'h1 pagesym))))

(define (blog-listing ptree-path)
  `(nav ,@(map (lambda (pagesym)
                 (page-link '() pagesym))
               (pagetree->list (get-pagetree ptree-path)))))

(define (rel-link rel pagesym)
  (if pagesym
    (->html (page-link `((rel ,rel)) pagesym))
    ""))


;; custom utility elements
(define items (default-tag-function 'ul))
(define item (default-tag-function 'li 'p))

(define (link url text) `(a ((href ,url)) ,text))

(define (code lang snippet) `(pre ((class ,(string-append "lang--" lang)))
                                  (code ,snippet)))
