# docker-elasticsearch-curator

This only job executed by the docker built from this repository is to clean the elastic search logstash history leaving only a configurable amount of days worth of logging in the system. The job runs in the specified interval.

It can be run as follows:

	docker run -d -e INTERVAL_IN_HOURS=24 -e ELASTICSEARCH_REPO=demo --link es1:elasticsearch visity/elasticsearch-curator
	
where **es1** is the name of the elasticsearch container and

* **INTERVAL\_IN\_HOURS**: The amount of time between two curator runs
* **ELASTICSEARCH_REPO**: The elasticsearch repository 
