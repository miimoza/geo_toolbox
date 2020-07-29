for i in $(seq 1 1141); do cat data/emplacement-des-gares-idf.csv | head -n $i | tail -n 1 | cut -d';' -f 5; done
