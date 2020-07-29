if [ $# -ne 1 ]; then
	echo "usage: ./station_density <station_name>"
	exit
fi


./city_density.sh $(./station_coord_info.sh $1 | jq -r '.city')
