if [ $# -ne 1 ]; then
	echo "usage: ./city_density <city_name>"
	exit
fi

city=$1

density=$(curl -s "https://data.iledefrance.fr/api/records/1.0/search/?dataset=metropole-densites-de-population-par-commune&q=$city&facet=densite_dhabitants" | jq -r ".facet_groups[0].facets[0].name")

echo $density
