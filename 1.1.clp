
;;;*** TEMPLATE ***;;;

(deftemplate software
     (slot name)
     (slot star)
     (slot attribute)
 )

;;;*** FACTS ***;;;

 (deffacts kinds
     (software (name fun) (star one) (attribute shakhsi))
     (software (name entertainment) (star two) (attribute shakhsi))
     (software (name game) (star three) (attribute shakhsi))
     (software (name news) (star three) (attribute work))
     (software (name allin1) (star three) (attribute work))
     (software (name technology) (star three) (attribute work))
  )

;;;*** RULES ***;;;

 (defrule rule1
     (software (name fun) (star one) (attribute shakhsi))
     (software (name entertainment) (star two) (attribute shakhsi))
      =>
     (assert (software (name Bazaar) (star four) (attribute shakhsi)))
  )

 (defrule rule2
     (software (name game) (star three) (attribute shakhsi))
     (software (name news) (star three) (attribute work))
     (software (name allin1) (star three) (attribute work))
     (software (name technology) (star three) (attribute work))
      =>
     (assert (software (name Instagram) (star five) (attribute work)))
  )

 (defrule rule3
     (software (name commercial) (star three))
     (software (name game) (star three) (attribute shakhsi))
      =>
     (assert (software (name BBC) (star three)))
  )

 (defrule rule4
     (software (name allin1) (star three) (attribute work))
     (software (name technology) (star three) (attribute work))
      =>
     (assert (software (name Line) (star three) (attribute work)))
  )

 (defrule rule5
     (software (name game) (star three) (attribute shakhsi))
     (software (name news) (star three) (attribute work))
     (software (name fun) (star one) (attribute shakhsi))
      =>
     (assert (software (name Asphalt) (star four) (attribute shakhsi)))
  )

(defrule rule6
     (software (name game) (star three) (attribute shakhsi))
     (software (name news) (star three) (attribute work))
     (software (name technology) (star three) (attribute work))
      =>
     (assert (software (name Google+) (star four) (attribute shakhsi)))
  )
