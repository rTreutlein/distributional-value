;; =============================================================================
;; ModusPonensRule
;;
;; <LinkType>
;;   A
;;   B
;; A
;; |-
;; B
;;
;; Due to type system limitations, the rule has been divided into 3:
;;       modus-ponens-inheritance-rule
;;       modus-ponens-implication-rule
;;       modus-ponens-subset-rule
;;
;; This rule contains less premises but thus is less precises than
;; PreciseModusPonens.
;;
;; -----------------------------------------------------------------------------

(use-modules (opencog distvalue))

(load "../utility.scm")

;; Generate the corresponding modus ponens rule given its link-type.
(define (gen-modus-ponens-rule link-type)
  (let* ((A (Variable "$A"))
         (B (Variable "$B"))
         (AB (link-type
               A
               B)))
  (Bind
    ;; Variable declaration
    (VariableList
      A
      B)
    ;; Patterns
    (And
      ;; Preconditions
      (Evaluation
        (GroundedPredicate "scm: has-dv")
        A)
      (Evaluation
        (GroundedPredicate "scm: has-dv")
        AB)
      ;; Pattern clauses
      AB
      A)
    ;; Rewrite
    (ExecutionOutputLink
      (GroundedSchemaNode "scm: modus-ponens-formula")
      (ListLink
        B
        AB
        A)))))

(define modus-ponens-inheritance-rule
  (gen-modus-ponens-rule InheritanceLink))

(define modus-ponens-implication-rule
  (gen-modus-ponens-rule ImplicationLink))

(define modus-ponens-subset-rule
  (gen-modus-ponens-rule SubsetLink))

(define (modus-ponens-formula B AB A)
    (let*
        ((key (PredicateNode "CDV"))
         (dvA (cog-value A key))
         (dvAB (cog-value AB key))
         (dvB (cog-cdv-get-unconditional dvAB dvA))
        )
        (update-dv B dvB)
    )
)

;; Name the rules
(define modus-ponens-inheritance-rule-name
  (DefinedSchemaNode "modus-ponens-inheritance-rule"))
(DefineLink modus-ponens-inheritance-rule-name
  modus-ponens-inheritance-rule)

(define modus-ponens-implication-rule-name
  (DefinedSchemaNode "modus-ponens-implication-rule"))
(DefineLink modus-ponens-implication-rule-name
  modus-ponens-implication-rule)

(define modus-ponens-subset-rule-name
  (DefinedSchemaNode "modus-ponens-subset-rule"))
(DefineLink modus-ponens-subset-rule-name
  modus-ponens-subset-rule)
