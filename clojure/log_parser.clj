(ns log-parser)

(def DT-FORMAT (DateTimeFormat/forPattern "yyyy-MM-dd HH:mm:ss"))
(def GMT-FORMAT (.withZone DT-FORMAT (DateTimeZone/forID "GMT")))

(defn parse-session [[session-id requests]]
  (let [metrics {:length (count requests)
                 :duration (duration requests)}]
    [[session-id metrics]]))

(defn averages [collected-values]
  (let [num-sessions (count collected-values)
        all-metrics (apply concat (vals collected-values))
        total-length (apply + (map :length all-metrics))
        total-duration (apply + (map :duration all-metrics))]
    {:average-length (/ total-length num-sessions)
     :average-duration (/ total-duration num-sessions)}))

(defn investigate-sessions [filename]
  (let [results (map-reduce parse-session averages (session-seq (request-seq filename)))]
    (println "Avg length:" (* 1.0 (:average-length results)))
    (println "Avg duration:" (* 1.0 (:average-duration results)))))

(defn record-start? [log-line]
  (.startsWith log-line "Processing"))

(defn next-log-record [log-lines]
  (let [head (first log-lines)
        body (take-while (complement record-start?) (rest log-lines))]
    (remove nil? (conj body head))))

(defn lazy-request-seq [log-lines]
  (lazy-seq
    (let [record (next-log-record log-lines)]
      (if (empty? record)
        nil
        (cons (remove empty? record)
              (lazy-request-seq (drop (count record) log-lines)))))))

(defn request-seq [filename]
  (->> (read-lines filename)
       (drop 2)
       (lazy-request-seq)))

(defn controller-name [log-record]
  (second (.split (first log-record) " ")))

(defn execution-time [log-record]
  (let [numbers (re-seq #"\d+" (last log-record))]
    (if (empty? numbers) 
      0
      (read-string (first numbers)))))

(defn day-of-request-str [log-record]
  (->> (first log-record)
       (re-seq #"\d+-\d+-\d+")
       (first)))

(defn time-of-request [log-record]
  (->> (first log-record)
       (re-seq #"\d+-\d+-\d+ \d+:\d+:\d+")
       (first)
       (.parseDateTime GMT-FORMAT)))

(defn session-id [log-record]
  (second (.split (second log-record) ": ")))