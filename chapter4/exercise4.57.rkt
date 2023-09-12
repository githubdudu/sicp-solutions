#lang sicp

(rule (same ?x ?x))
(rule (replace ?person-1 ?person-2)
      (and (job ?person-1 ?job-1)
           (job ?person-2 ?job-2)
           (not (same ?person-1 ?person-2))
           (or (same ?job-1 ?job-2)
               (can-do-job ?job-1 ?job-2))))

;;; all people who can replace Cy D. Fect;
(replace (Fect Cy D) ?x)
;;; all people who can replace someone who is being paid more than they are, together with the two salaries.
(and (replace ?person-1 ?person-2)
     (salary ?person-1 ?salary-1)
     (salary ?person-2 ?salary-2)
     (lisp-value? < ?salary-1 ?salary-2))