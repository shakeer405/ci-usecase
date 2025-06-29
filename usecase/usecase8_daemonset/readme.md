What Is a DaemonSet?
A DaemonSet ensures that one pod runs on each node (or selected nodes) in a Kubernetes cluster.
Use case: Run a background service on all nodes, like log collection, metrics agent, filebeat, fluentd, etc.

Common DaemonSet Examples:
| Use Case          | Tool                            |
| ----------------- | ------------------------------- |
| Log collection    | Fluentd, Filebeat, Vector       |
| Monitoring        | Node Exporter, Prometheus Agent |
| Security agent    | Falco, CrowdStrike              |
| Networking helper | CNI plugin, kube-proxy          |

DaemonSet vs Deployment:
| Feature       | Deployment              | DaemonSet                         |
| ------------- | ----------------------- | --------------------------------- |
| Pod placement | Anywhere (by scheduler) | One per node (or label-select)    |
| Scaling       | `replicas: N`           | Controlled automatically          |
| Use case      | Apps, APIs              | Node-level agents, log collectors |

Real Use Case: Collect Logs on Every Node
Let’s deploy Filebeat via a DaemonSet to collect logs from all nodes.
Filebeat DaemonSet Example
1️⃣ Namespace + ServiceAccount
apiVersion: v1
kind: Namespace
metadata:
  name: logging
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: filebeat
  namespace: logging

2️⃣ DaemonSet YAML (filebeat)
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: filebeat
  namespace: logging
spec:
  selector:
    matchLabels:
      name: filebeat
  template:
    metadata:
      labels:
        name: filebeat
    spec:
      serviceAccountName: filebeat
      containers:
        - name: filebeat
          image: docker.elastic.co/beats/filebeat:8.12.2
          args: [
            "-c", "/etc/filebeat.yml",
            "-e"
          ]
          volumeMounts:
            - name: config
              mountPath: /etc/filebeat.yml
              subPath: filebeat.yml
            - name: varlog
              mountPath: /var/log
            - name: containerlogs
              mountPath: /var/lib/docker/containers
              readOnly: true
      volumes:
        - name: config
          configMap:
            name: filebeat-config
        - name: varlog
          hostPath:
            path: /var/log
        - name: containerlogs
          hostPath:
            path: /var/lib/docker/containers

3️⃣ Filebeat ConfigMap (basic config)
apiVersion: v1
kind: ConfigMap
metadata:
  name: filebeat-config
  namespace: logging
data:
  filebeat.yml: |
    filebeat.inputs:
      - type: log
        paths:
          - /var/log/*.log
    output.console:
      pretty: true
This setup reads log files from host /var/log and outputs to stdout. You can update it to output to Elasticsearch, Loki, etc.

Deploy Steps

kubectl apply -f filebeat-daemonset.yaml

Check logs:
kubectl logs -f -n logging -l name=filebeat
Summary Documentation
What DaemonSet Does:
Makes sure one pod runs on every node.

Automatically deploys when new nodes join.

Used for tools that interact with the host system, like logs or metrics.

🔹 Best Practices:
Use tolerations if you want to run on master/control-plane nodes.

Label nodes and use nodeSelector or affinity to limit scope.

Use DaemonSets for system-level agents, not app containers.