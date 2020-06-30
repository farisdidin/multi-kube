 docker build -t farisdidin/multi-client:latest -t farisdidin/multi-client:$SHA -f ./client/Dockerfile ./client
 docker build -t farisdidin/multi-server:latest -t farisdidin/multi-server:$SHA -f ./server/Dockerfile ./server
 docker build -t farisdidin/multi-worker:latest -t farisdidin/multi-worker:$SHA -f ./worker/Dockerfile ./worker 
 docker push farisdidin/multi-client:latest 
 docker push farisdidin/multi-client:$SHA
 docker push farisdidin/multi-server:latest
 docker push farisdidin/multi-server:$SHA
 docker push farisdidin/multi-worker:latest
 docker push farisdidin/multi-worker:$SHA
 kubectl apply -f k8s
 kubectl set image deployments/server-deployment server=farisdidin/multi-server:$SHA  
 kubectl set image deployments/client-deployment client=farisdidin/multi-client:$SHA
 kubectl set image deployments/worker-deployment worker=farisdidin/multi-woker:$SHA