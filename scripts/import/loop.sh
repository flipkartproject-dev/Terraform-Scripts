set -f
IFS='
'
set -- $( cat datasetname.txt )
for i in `cat datasetid.txt`
do
  echo "terraform import google_bigquery_dataset.$1 $i" > terraformnew.sh
  sh terraformnew.sh
  shift
done







