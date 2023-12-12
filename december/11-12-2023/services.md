# Services #

In Kubernetes, a Service is an abstraction that defines a logical set of Pods and a policy by which to access them. Services enable loose coupling between microservices in a distributed system, allowing components to communicate with each other without needing to know the details of how they are implemented or where they are running.

**Here are the key aspects of Kubernetes Services:**

1. **Types of Services:**

**ClusterIP:** Exposes the Service on a cluster-internal IP. This is the default type.

**NodePort:** Exposes the Service on each Node's IP at a static port (NodePort) on the cluster.

**LoadBalancer:** Creates an external load balancer in cloud providers and assigns a unique external IP.
ExternalName: Maps the Service to the contents of the externalName field (e.g., a DNS name).

2. **Service Definition:**
A Service is defined in a YAML file. Below is an example of a simple ClusterIP Service:

		apiVersion: v1
		kind: Service
		metadata:
  			name: my-service
		spec:
  			selector:
   			 app: my-app
 			 ports:
    			- protocol: TCP
    			  port: 80
     			  targetPort: 8080
Here

1) **selector** specifies the set of Pods targeted by this Service.

2) **ports** define how the Service should expose the application.


Use **kubectl apply** to create a Service based on the YAML file

	kubectl apply -f your-service-definition.yaml



- The Service allows Pods to access other Pods using the Service's DNS name.


**ClusterIP Service (Default)**

- The default type, ClusterIP, exposes the Service inside the cluster. Other Pods can access it using the Service's cluster-internal IP


