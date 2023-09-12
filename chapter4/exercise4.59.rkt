#lang sicp

(meeting accounting (Monday 9am))
(meeting administration (Monday 10am))
(meeting computer (Wednesday 3pm))
(meeting administration (Friday 1pm))

(meeting whole-company (Wednesday 4pm))

;;;On Friday morning, Ben wants to query the data base for all the meetings that occur that day.
(meeting ?division (Friday ?time))

;;;b
(rule (meeting-time ?person ?day-and-time)
      (and (job ?person (?division . ?rest))
           (or (meeting ?division ?day-and-time)
               (meeting whole-company ?day-and-time))))


;;;c
(and (meeting-time (Hacker Alyssa P) (Wednesday ?t))
     (meeting ?d (Wednesday ?t)))