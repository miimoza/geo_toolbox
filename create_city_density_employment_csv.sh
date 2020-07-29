yellow="\033[1;33m"
white="\033[0m"
green="\033[1;32m"
red="\033[1;31m"

while read -r station; do
    citycode=$(./station_coord_info.sh "$station" | jq -r ".citycode")
    city=$(./station_coord_info.sh "$station" | jq -r ".city")
    
    if [[ $citycode == 75* ]]; then
         citycode=75056
    fi

    density=$(./city_density.sh $city)
    if [ $density == "134.88372093" ]; then
        density=21067
    fi

    nb_employment=$(./city_nb_employment.sh "$citycode") 


    echo -e "$yellow$station$white | CITY: $red$citycode $city$white | DENSITY: $green$density$white hab/km2 | NB EMPLOYMENT: $green$nb_employment$white"
    
done <<< $(./list_stations.sh)
