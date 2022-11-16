kubectl get pods | grep -i run | awk '{print $1}' | grep -v NAME | while read line; \
do rollout latesst dc/$line; \
done;  
