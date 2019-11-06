#lang racket/base
(require pollen/tag pollen/decode txexpr)
(provide (all-defined-out))

(define (root . elements)
  (txexpr 'main
          empty
          (decode-elements
            elements
            #:txexpr-elements-proc decode-paragraphs
            #:string-proc (compose1 smart-quotes smart-dashes))))

(define items (default-tag-function 'ul))
(define item (default-tag-function 'li 'p))
(define (link url text) `(a ((href ,url)) ,text))

(define (code lang snippet) `(pre ((class ,(string-append "lang--" lang)))
                                  (code ,snippet)))
