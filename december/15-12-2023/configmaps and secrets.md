#**ConfigMaps**#

**Purpose**:

ConfigMaps are used to store non-sensitive configuration data in key-value pairs.
They can be used to store configuration settings, environment variables, or any other configuration information needed by applications.

**Creating ConfigMaps**

ConfigMaps can be created using imperative commands, declarative YAML files, or via the Kubernetes API.

**Example YAML for creating a ConfigMap**

	apiVersion: v1
	kind: ConfigMap
	metadata:
  		name: my-configmap
	data:
  		key1: value1
  		key2: value2

**Using ConfigMaps**

ConfigMaps can be mounted as volumes in a pod, allowing applications to read configuration data from files.
Environment variables can also be set in a pod based on ConfigMap data.

**Example Mounting in a Pod**


	spec:
  	containers:
  		- name: my-container
    		image: my-image
    		volumeMounts:
    	- name: config-volume
      		mountPath: /etc/config
		volumes:
		- name: config-volume
  		configMap:
    	  name: my-configmap




# **Secrets** #

**Purpose**

Secrets are used to store sensitive information, such as passwords, API keys, and certificates.
They are encoded in base64 by default, but they are not encrypted, so Kubernetes RBAC (Role-Based Access Control) should be used to control access.

**Creating Secrets**

Secrets can be created using imperative commands, declarative YAML files, or via the Kubernetes API.

**Example YAML for creating a Secret**

	apiVersion: v1
	kind: Secret
	metadata:
 	 name: my-secret
	type: Opaque
	data:
 	 username: <base64-encoded-username>
 	 password: <base64-encoded-password>

**Using Secrets**

Secrets can be mounted as volumes in a pod, similar to ConfigMaps.
Environment variables can also be set in a pod based on Secret data.

**Example Mounting in a Pod**


	spec:
  	  containers:
  	  - name: my-container
        image: my-image
        volumeMounts:
          - name: secret-volume
            mountPath: /etc/secret
	  volumes:
	  - name: secret-volume
  	    secret:
          secretName: my-secret