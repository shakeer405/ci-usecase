Concept Overview
Taints are applied to nodes to repel pods.
Tolerations are applied to pods to allow them to schedule onto tainted nodes.

Think of it like:
Taint = “Stay away from me unless you tolerate me.”
Toleration = “I’m okay with being on this tainted node.”

1. What is a Taint?
A taint on a node has this format:

<key>=<value>:<effect>

kubectl taint nodes node1 key1=value1:NoSchedule

This means:

"Do not schedule pods onto node1 unless the pod has a toleration for key1=value1 with effect: NoSchedule
| Effect             | Behavior                                                       |
| ------------------ | -------------------------------------------------------------- |
| `NoSchedule`       | Pods are **not scheduled** unless they **tolerate** the taint  |
| `PreferNoSchedule` | Scheduler **tries to avoid** this node, but **can** schedule   |
| `NoExecute`        | Existing pods are **evicted** if they don't tolerate the taint |

2.What is a Toleration?
A toleration allows a pod to be scheduled to a tainted node.
tolerations:
  - key: "key1"
    operator: "Equal"
    value: "value1"
    effect: "NoSchedule"

Full Pod Spec:
apiVersion: v1
kind: Pod
metadata:
  name: toleration-demo
spec:
  containers:
    - name: app
      image: nginx
  tolerations:
    - key: "key1"
      operator: "Equal"
      value: "value1"
      effect: "NoSchedule"
     
This pod will be allowed to schedule on a node tainted with:
kubectl taint nodes <node-name> key1=value1:NoSchedule

Adding and Removing Taints:
Add taint:
kubectl taint nodes node1 key1=value1:NoSchedule
Remove taint:
kubectl taint nodes node1 key1:NoSchedule-
Use a - at the end to remove the taint.
Common Use Cases:
| Use Case                                 | Taint Type         | Why                                   |
| ---------------------------------------- | ------------------ | ------------------------------------- |
| Run only critical apps on specific nodes | `NoSchedule`       | Prevent others from using             |
| Run GPU workloads on GPU nodes only      | `NoSchedule`       | Avoid scheduling CPU pods             |
| Evict pods if node is unhealthy          | `NoExecute`        | E.g. `node.kubernetes.io/unreachable` |
| Spot instances or preemptible VMs        | `PreferNoSchedule` | Let scheduler decide                  |

Default Taints to Know
| Taint                                       | Meaning                        |
| ------------------------------------------- | ------------------------------ |
| `node.kubernetes.io/unreachable:NoExecute`  | Node is unreachable            |
| `node.kubernetes.io/not-ready:NoExecute`    | Node not ready                 |
| `node-role.kubernetes.io/master:NoSchedule` | Applied to control plane nodes |
