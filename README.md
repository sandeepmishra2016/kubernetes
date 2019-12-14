
              Kubernetes


When we deploy Kubernetes, it creates a cluster which will have minimum one master and one worker node.
Worker node hosts a pod that are components of the application. The master node manages the worker nodes and the pods in the cluster.

Master Node (Control Plane):
Master components makes global decision about the cluster and they detect and respond to cluster events.

Kube-apiserver -
This component is front end of control plane which exposes the Kubernetes API.
ETCD-
It’s consistent and highly available key value store used as Kubernetes backing store for all the cluster data.
Kube-controller manger -
Each controller is a separate process but to reduce the complexity, they are all combined into single binary and runs in a single process. It includes below four components…

Node Controller > Responsible for monitoring and responding when nodes go down.
Replication controller > Responsible for maintaining the correct number of pods for replication controller object in the system.

Endpoints Controller > Responsible for endpoint objects like, Joins services and pods
Service account and Token Controllers > Create default accounts and API access token for new namespace.
Kube-scheduler -
It watches the newly created pods that have no node assigned, and select a node for them to run on.







Worker Node:
Node components runs on every node, maintain pods and providing the Kubernetes runtime environment 

Kubectl -
Kubectl is an agent which runs on each node in the cluster.it makes sure that containers are running in a pod. It has a copy of pod spec (yaml/json config file) and ensure that pods are running based on pod spec.
Kube-proxy -
Kube-proxy run on each node and, it’s a network proxy, implementing part of the Kubernetes service concept.
It maintains the network rules on the nodes. These network rules allow network communication to your pods from network session inside or outside of your cluster.

Persistent Volume:
Volumes and Persistent Volume Claims are two separate objects in the Kubernetes namespace.
An Administrator creates a set of Persistent Volumes and a user creates Persistent Volume Claims to use the storage. Once the Persistent Volume Claims are created, Kubernetes binds the Persistent Volumes to Claims based on the request and properties set on the volume. 
Every Persistent Volume Claims is bound to single Persistent volume during the binding process Kubernetes tries to find a persistent volume that has enough capacity as requested by the claim and any other request properties such as access modes volume modes storage class etc. 
However, if there are multiple possible matches for a single claim and you would like to specifically use a particular volume you could still use labels and selectors to bind to the right volumes.

The persistent volume claim (pvc) is bound to persistent volume (pv) when we run to get volumes command.


1st-
When we delete the PVC, what will happen to PV, so here we can choose what will happen to PV.
By default, ‘persistentVolumeReclaimPolicy’ value will be ‘retain’ so the persistent volume will remain until it is manually deleted by the administrator but it’s not available for any other claims 
2nd-
It is not available for reuse by any other claims or it can be deleted automatically. This way as soon as the claim is deleted the volume will be deleted as well thus freeing up storage.
3rd-
On the end storage device or a third option is to recycle. In this case the data in the data volume will be scrubbed before making it available to other claims.

Access Modes:
1. ReadOnlyMany
2. ReadWriteOnce
3. ReadWriteMany

