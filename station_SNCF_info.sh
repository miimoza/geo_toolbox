if [ $# -lt 2 ]; then
	echo "usage: ./station_info <station_name> <select_number> -<option>"
	echo ""
	echo "Option (not mandatory):"
	echo "	-id: print only id"
	echo "	-lat: print only latitude"
	echo "	-lon: print only longitude"
	exit
fi

station=$1
select_number=$2



station_info=$(jq -r "[.[] | select(.fields.nom_gare | test(\"$station\"; \"i\"))][$select_number].fields" data/pos_stations_sncf.json)

stop_id=$(echo $station_info | jq -r '.gares_id')
stop_name=$(echo $station_info | jq -r '.nom_gare')
stop_coordinates=$(echo $station_info | jq -r '.geo_shape.coordinates')


if [ $# -eq 3 ]; then
	if [ $3 = "-id" ]; then
		echo $stop_id
	elif [ $3 = "-lat" ]; then
		echo $stop_coordinates | grep -o "[0-9.]*" | tail -1
	elif [ $3 = "-lon" ]; then
		echo $stop_coordinates | grep -o "[0-9.]*" | head -1
	else
		echo "Option possible are:"
		echo "	-id: print only id"
		echo "	-lat: print only latitude"
		echo "	-lon: print only longitude"
		exit
	fi
else
	echo "[$stop_id]: $stop_name $stop_coordinates"
fi
