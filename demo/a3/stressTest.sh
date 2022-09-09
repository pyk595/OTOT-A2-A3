echo starting stress test

kubectl describe hpa

curl "localhost/?[0-4999]" --parallel --parallel-max 100 --no-progress-meter > /dev/null


kubectl describe hpa 