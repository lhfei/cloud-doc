curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-56-45/host_components/JOURNALNODE 
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-56-48/host_components/JOURNALNODE
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-56-58/host_components/JOURNALNODE
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-58-23/host_components/JOURNALNODE
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-59-238/host_components/JOURNALNODE
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-77-222/host_components/JOURNALNODE


curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-15-202/host_components/ZKFC 
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-15-206/host_components/ZKFC 
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-15-165/host_components/ZKFC 
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-92-181/host_components/ZKFC 

curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X GET http://10.182.88.131/api/v1/clusters/DATA_THINKER/host_components?HostRoles/component_name=ZKFC


curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X GET http://10.182.88.131/api/v1/clusters/DATA_THINKER/host_components?HostRoles/component_name=NAMENODE


curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-15-165/host_components/NAMENODE
curl -u admin:Lhfei@Root#01 -H "X-Requested-By: ambari" -i -X DELETE http://10.182.88.131/api/v1/clusters/DATA_THINKER/hosts/host-10-182-15-206/host_components/NAMENODE