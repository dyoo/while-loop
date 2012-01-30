#lang scribble/manual
@(require planet/scribble
          (for-label "main.rkt"
                     racket/base))

@title{While loops for Racket}

This basically provides @racket[while], @racket[break] and
@racket[continue].


@section{Example and usage}
@defmodule/this-package[main]

@codeblock|{
#lang racket/base
(require (planet dyoo/while-loop))

(while (not (string=? (read-line)
                      "quit"))
  (printf "quit?  "))

(while #t
  (define input (read-line))
  (unless (regexp-match #px"please" input)
    (printf "You didn't say please\n")
    (continue))
  (when (regexp-match #px"quit" input)
    (break)))
}|

@defform[(while test body ...)]{
Repeat the evaluation of the @racket[body] so long as @racket[test]
is true.
}

@defform[(break)]{Break out of the innermost loop.}

@defform[(continue)]{Restart the innermost loop.}
