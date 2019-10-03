
;;;;;* DEF FUNCTIONS *;;;;;


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))


;;;;;* QUERY RULES *;;;;;


(defrule determine-state ""
   (not (what-kind ?))
   (not (pishnahad ?))
   =>
   (assert (what-kind (yes-or-no-p "aya be barname haye varzeshi alaghe darid?(yes/no)? "))))
   
(defrule determine-normal ""
   (what-kind yes)
   (not (pishnahad ?))
   =>
   (assert (normal (yes-or-no-p "aya be chizhaye gunagun alaghe darid (yes/no)? "))))

(defrule determine-fun ""
   (what-kind no)
   (not (pishnahad ?))   
   =>
   (assert (fun (yes-or-no-p "aya be barname haye fun alaghe darid(yes/no)? "))))
   
(defrule determine-farhangi ""
   (normal no)
   (not (pishnahad ?))
   =>
   (assert (farhangi (yes-or-no-p "aya be barname farhangi alaghe darid?(yes/no) "))))
   
(defrule determine-bazar ""
   (normal no)
   (not (pishnahad ?))
   =>
   (assert (bazar (yes-or-no-p "aya barname bazar ruye gushi shoma nasb ast (yes/no)? "))))

(defrule determine-var ""
   (normal no)
   (not (pishnahad ?))
   =>
   (assert (engine-varzesh (yes-or-no-p "aya barname varzesh3 ruye gushi shoma nasb ast(yes/no)? "))))

(defrule determine-net""
   (normal no)
   (not (pishnahad ?))
   =>
   (assert (engine-net 
               (yes-or-no-p "aya internet masrafi shoma hajmi ast (yes/no)? "))))

(defrule determine-rate""
   (what-kind no)
   (fun  yes)
   (not (pishnahad ?))
   =>
   (assert (rate 
              (yes-or-no-p "aya nazarate baghie karbarane barname baraye shoma mohem ast (yes/no)? "))))

(defrule determine-battery-state ""
   (fun  no)
   (not (pishnahad ?))
   =>
   (assert (battery
              (yes-or-no-p "masrafe batri shoma kam ast(yes/no)? "))))

(defrule determine-star ""
   (or (and (what-kind no)      
            (fun  yes))
       (engine-net yes))
   (not (pishnahad ?))
   =>
   (assert (point-star
      (ask-question "barname chand setare mikhahid (one/two/three)? "
                    one two three))))

(defrule determine-test ""
   (what-kind no)      
   (fun  no)
   (battery yes)
   (not (pishnahad ?))
   =>
   (assert (test-positive
              (yes-or-no-p "barname englisi mored ghabul ast (yes/no)? "))))


;;;;;* pishnahad RULES *;;;;;


(defrule normal""
   (normal yes)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "Bazaar.")))

(defrule farhangi ""
   (farhangi yes)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "BBC News."))) 

(defrule bazar ""
   (bazar yes)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "Instagram.")))     

(defrule engine-varzesh ""
   (engine-varzesh yes)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "Flash player.")))

(defrule net ""
   (rate  no)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "BWmeter.")))

(defrule battery""
   (battery no)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "DU Battery Saver.")))

(defrule star""
   (point-star b)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "MX Player.")))

(defrule point ""
   (point-star p)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "KM player.")))

(defrule test-positive-yes ""
   (test-positive yes)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "Shazam.")))

(defrule test-positive-no ""
   (test-positive no)
   (not (pishnahad ?))
   =>
   (assert (pishnahad "Line.")))

(defrule no ""
  (declare (salience -10))
  (not (pishnahad ?))
  =>
  (assert (pishnahad "Zooper.")))


;;;;;*    print    *;;;;;


(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Soft Suggestion Expert System")
  (printout t crlf crlf))

(defrule print-pishnahad ""
  (declare (salience 10))
  (pishnahad ?item)
  =>
  (printout t crlf crlf)
  (printout t "Pishnahad :")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))

