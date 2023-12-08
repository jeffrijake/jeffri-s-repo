Kubernetes:

what is kubernetes?

ans) kubernetes is an open source Orchestration system for Docker containers

	1) it lets you schedule containers on a cluster of machines.
	2)you can run multiple containers on one machine.
	3)you can run long running services (like web applications).
	4)kubernetes will manage the state of these containers.
	  a) can start the container on specific nodes
	  b) will restart a container when it gets killed
	  c) can move containers from one node to another node.
	5)Kubernetes is a platform that will manage the containers for you instead of just running a few docker containers on one host manually.
	6)kubernetes clusters can start with one node until thousands of nodes.
	7)some other popular docker orchestratiors are:
		a)docker Swarm
		b)Mesos


Kubernetes Advantages:
1) you can run Kubernetes anywhere
	a)on-premise (own datacenter)
	b)public (google cloud,AWS)
	c)Hybrid: public & private
2)highly modular
3)open source
4)great community
5)backed by google



Docker:
1) Docker is the most popular container software
	an alernative to docker is rkt(rocket) - which also works with Kubernetes.

2)Docker Engine:
	a)The docker runtime
	b)software to make run docker images.
3)Docker Hub
	a)Online service to store and fetch docker images
	b)Also allows you to build docker images online.


to build containers, you can use "Docker Engine"

**POD**

- A pod is the smallest execution unit in kubernetes.

- A pod is a group of one or more containers

- if a pod fails kubernetes can automatically create create a new replica of that pod to continue operation.
- once a pod is created we can't edit the configuration, instead the pod is killed and restarted with new configuration.
- Pods follow a defined lifecycle, starting in the Pending phase, moving through Running if at least one of its primary containers starts OK, and then through either the Succeeded or Failed phases depending on whether any container in the Pod terminated in failure.


**Pods and controllers**

- You can use workload resources to create and manage multiple Pods for you
- A controller for the resource handles replication and rollout and automatic healing in case of Pod failure
- if a Node fails, a controller notices that Pods on that Node have stopped working and creates a replacement Pod. The scheduler places the replacement Pod onto a healthy Node.

**POD Template**

- there is a sample template of a pod which is written below.
- The container in that Pod prints a message then pauses.

         apiVersion: batch/v1
          kind: Job
          metadata:
            name: hello
            spec:
              template:
                   ##This is the pod template##
            spec:
              containers:
                 -name: hello
                     image: busybox:1.28
                     command: ['sh', '-c', 'echo "Hello, Kubernetes!" && sleep 3600']
                     restartPolicy: OnFailure
                          ##The pod template ends here##
