
(define (update-dv atom dv)
  (let* ((key (PredicateNode "CDV"))
         (old-dv (cog-value atom key))
        )
        (if (null? old-dv)
            (cog-set-value! atom key dv)
            (cog-set-value! atom key (cog-dv-merge-hi-conf dv old-dv))
        )
  )
)

(define (update-cdv atom cdv)
  (let* ((key (PredicateNode "CDV"))
         (old-cdv (cog-value atom key))
        )
        (if (null? old-cdv)
            (cog-set-value! atom key cdv)
            (cog-set-value! atom key (cog-cdv-merge-hi-conf cdv old-cdv))
        )
  )
)

(define (cog-atom-eq atom1 atom2)
    (let* ((tv (cog-evaluate! (Equal atom1 atom2)))
           (tvs (cog-tv-mean tv))
          )
      (= tvs 1.0)
    )
)