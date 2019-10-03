
;;;;;* QUERY RULEs *;;;;;

(defrule software""
   =>
   (printout t "what is your favourite software type?(
 1.Game 
 2.News 
 3.Communication 
 4.Browser  
 5.All in 1 :  ")
   (assert (q1 (read))))


(defrule kind""
   =>
   (printout t "persian or english?(
 1.persian 
 2.english
 3.farghi nadarad  :  ")
   (assert (q2 (read))))



;;;;;*****  KB *****;;;;;

(defrule ans1 ""
(not (result ?))
   (q1 1)
   (q2 1)
    =>
   (assert (result "Asre padeshahan")))

(defrule ans2 ""
(not (result ?))
   (q1 1)
   (q2 2)
    =>
   (assert (result "Football manager 2016")))

(defrule ans3 ""
(not (result ?))
   (q1 2)
   (q2 1)
    =>
   (assert (result "Aparat")))
(defrule ans4 ""
(not (result ?))
   (q1 2)
   (q2 2)
    =>
   (assert (result "BBC News 3.6")))
(defrule ans5 ""
(not (result ?))
   (q1 3)
   (q2 1)
    =>
   (assert (result "Suigle")))
(defrule ans6 ""
(not (result ?))
   (q1 3)
   (q2 2)
    =>
   (assert (result "Telegram")))
(defrule ans7 ""
(not (result ?))
   (q1 4)
   (q2 1)
    =>
   (assert (result "nothing")))
(defrule ans8 ""
(not (result ?))
   (q1 4)
   (q2 2)
    =>
   (assert (result "Chrome")))
(defrule ans9 ""
(not (result ?))
   (q1 5)
   (q2 1)
    =>
   (assert (result "Bazaar")))
(defrule ans10 ""
(not (result ?))
   (q1 5)
   (q2 2)
    =>
   (assert (result " Instagram")))
(defrule ans11 ""
(not (result ?))
   (q1 5)
   (q2 3)
    =>
   (assert (result " Instagram")))
(defrule ans12 ""
(not (result ?))
   (q1 4)
   (q2 3)
    =>
   (assert (result " Opera ")))
(defrule ans13 ""
(not (result ?))
   (q1 3)
   (q2 3)
    =>
   (assert (result " Line ")))
(defrule ans14 ""
(not (result ?))
   (q1 2)
   (q2 3)
    =>
   (assert (result " IRIB Pack ")))
(defrule ans15 ""
(not (result ?))
   (q1 1)
   (q2 3)
    =>
   (assert (result " Ice Age ")))
(defrule print-result ""
  (declare (salience -15))
  (result ?item)
  =>
  (format t " %s%n%n%n" ?item))

