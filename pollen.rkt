#lang racket/base
(require pollen/core
         pollen/tag
         pollen/template
         pollen/pagetree
         pollen/decode
         txexpr
         web-server/templates
         racket/file)
(provide (all-defined-out))

(define (include-as-html path)
  (file->string path #:mode 'text))

;; render an <article> as the root of each post's main content
(define (root . elements)
  `(div
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
								 `(article
										(h2 ,(page-link '() pagesym))
										(h3 ,@(select-from-doc 'h2 pagesym))))
							 (pagetree->list (get-pagetree ptree-path)))))

(define (rel-link rel pagesym)
  (if pagesym
    (->html (page-link `((rel ,rel)) pagesym))
    ""))


;; custom utility elements
(define (link url text) `(a ((href ,url)) ,text))

(define (code lang snippet) `(pre ((class ,(string-append "lang--" lang)))
                                  (code ,snippet)))

(define (img src alt) `(img ((src ,src) (alt ,alt))))
