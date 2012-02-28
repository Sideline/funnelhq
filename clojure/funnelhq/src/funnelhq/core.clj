(ns funnelhq.core
	(use 'clojure.java.io :as io]))

(def *rails-log-file* "log/development.log")

(defn lazy-parse-log [src]
  "Parse the log into a lazy seq"
  (with-open [reader (io/reader src)]
    (line-seq reader)))

