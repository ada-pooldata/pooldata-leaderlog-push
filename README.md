# Pooldata Leaderlog Push Script

## Prerequisites
- [CNCLI](https://github.com/AndrewWestberg/cncli) with a synchronized cncli.db SQLite database running
- an API key to send your slots to pooldata.live API (can be requested on our [Telegram channel](https://t.me/pooldata))
- sqlite3 package installed

## How to setup
- copy pooldata.sh anywhere you like on the node where cncli is running
- edit pooldata.sh variables:
  - **CNCLI_DB**: path of cncli.db file
  - **POOL_ID**: hash of the pool sending the leaderlog data
  - **API_KEY**: pooldata.live API Key

## how to run 
The script can be run manually or scheduled via crontab.
The metric on pooldata.live grafana datasource is called **pool.epoch_leader_blocks**
