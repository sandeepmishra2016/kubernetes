# kubernetes



				              Kubernetes


When we deploy Kubernetes, it creates a cluster which will have minimum one master and one worker node.
Worker node hosts a pod that are components of the application. The master node manages the worker nodes and the pods in the cluster.


Master Node (Control Plane):
Master components makes global decision about the cluster and they detect and respond to cluster events.

Kube-apiserver –
This component is front end of control plane which exposes the Kubernetes API.
ETCD—
It’s consistent and highly available key value store used as Kubernetes backing store for all the cluster data.
Kube-controller manger –
Each controller is a separate process but to reduce the complexity, they are all combined into single binary and runs in a single process. It includes below four components…

Node Controller > Responsible for monitoring and responding when nodes go down.
Replication controller > Responsible for maintaining the correct number of pods for replication controller object in the system.

Endpoints Controller > Responsible for endpoint objects like, Joins services and pods
Service account and Token Controllers > Create default accounts and API access token for new namespace.
Kube-scheduler –
It watches the newly created pods that have no node assigned, and select a node for them to run on.



Worker Node:
Node components runs on every node, maintain pods and providing the Kubernetes runtime environment 

Kubectl –
Kubectl is an agent which runs on each node in the cluster.it makes sure that containers are running in a pod. It has a copy of pod spec (yaml/json config file) and ensure that pods are running based on pod spec.
Kube-proxy –
Kube-proxy run on each node and, it’s a network proxy, implementing part of the Kubernetes service concept.
It maintains the network rules on the nodes. These network rules allow network communication to your pods from network session inside or outside of your cluster.


