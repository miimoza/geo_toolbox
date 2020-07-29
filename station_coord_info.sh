if [ $# -ne 1 ]; then
	echo "usage: ./station_coord_info <station_name>"
	exit
fi

./coord_info.sh $(./station_SNCF_info.sh "$1" 0 -lon) $(./station_SNCF_info.sh "$1" 0 -lat) 
