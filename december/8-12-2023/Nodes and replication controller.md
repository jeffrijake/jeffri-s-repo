#**Nodes**#

A node is a virtual or physical machine that you run your workloads on.

In kubernetes we operate on clusters, which are groups of one or more worker nodes.

Each node actually contains the services necessary to run pods. 

A container runtime for running containers.a kubelet for making sure that everything that everything should be running is, and the kube-proxy for handling networking.

Control plane is responsible for handling all of these details by exposing an API





#**Replication Controller**#

A ReplicationController is a resource object that ensures a specified number of replicas of a pod are running at all times. It helps maintain the desired number of pod instances, replacing failed instances or scaling the number of replicas up or down as needed.

**Feature of replication controller**

1) Desired state:	
	It specifies the desired state of pod which includes the number of pods should be running.

2) Automatic Scaling:
	it automatically scales the number of replicas based on the desired state. it will create when we have less that desired state and it will automatically terminates if we have more that the desired state.

3) Selectors:
	It uses label selectors to identify the pods. any pods with the same labels considers itself as a part of RC.

4) Declarative Configuration:
	configuration of replication controller is typically done declaratively using yaml or json.

**example of RC**

		apiVersion: v1
		kind: ReplicationController
		metadata:
  			name: my-replication-controller
		spec:
  			replicas: 3
  		selector:
    		app: my-app
  		template:
    		metadata:
     			 labels:
       				 app: my-app
    	spec:
     		 containers:
      		 - name: my-container
        	   image: my-container-image