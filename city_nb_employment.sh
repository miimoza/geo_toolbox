if [ $# -ne 1 ]; then
	echo "usage: ./city_nb_employment <city_name>"
	exit
fi

city=$1

nb_employment=$(cat data/emplois_par_communes.csv | grep -i "$city;" | cut -d';' -f 3 | head -n 1)
echo $nb_employment
