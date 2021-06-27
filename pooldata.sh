#!/usr/bin/env bash

########################### VARIABLES ###########################
CNCLI_DB="cncli.db"
POOL_ID="eb6e1949ef2e1f2cdb9b041d2a4b86d4d837798ab3ddfe53cc4cafe4"
API_KEY="4Kes4lFbxxUavfGTgLrOJ1QncQcXhQ3pMG9F4nJXqlU"
#################################################################

#### SEND LEADERSLOTS ####
sqlite3 $CNCLI_DB "select * from slots order by epoch desc limit 2" | awk -F'|' '
   # sqlite output line - pick up fields and store in arrays
   { id[++i]=$1; epoch[i]=$2; pool_id[i]=$3; slot_qty[i]=$4; slots[i]=$4; hash[i]=$4; }

   END {
      printf "{ \n |epochs|: [\n";
      for(j=1;j<=i;j++){
         printf "  {\n"
         printf "    |epoch|:|%s|,\n",epoch[j]
         printf "    |blocks|:%d\n",slot_qty[j]
         closing="  },\n"
         if(j==i){closing="  }\n"}
         printf closing;
      }
      printf "]\n } \n";
   }' | tr '|' '"'  >> query.json

curl -X POST -H "Content-Type: application/json" -d @query.json https://api.pooldata.live/cardano/$POOL_ID/leader/$API_KEY

rm query.json
