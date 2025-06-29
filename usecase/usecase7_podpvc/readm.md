What is a PVC (PersistentVolumeClaim)?

A PVC is a request for storage by a Pod.
It abstracts how and where storage comes from.

It allows:

A Pod to ask for storage
Kubernetes to provide the storage via a PersistentVolume (PV) or StorageClass

Core Flow
Pod <-- references -- PVC <-- bound to -- PV or dynamically provisioned volume

Key Concepts
| Term             | Description                                |
| ---------------- | ------------------------------------------ |
| **Pod**          | Application that needs disk                |
| **PVC**          | Request for disk (5Gi, RWO, etc.)          |
| **PV**           | Actual storage (hostPath, NFS, disk, etc.) |
| **StorageClass** | How to provision dynamic PVs automatically |

PVC Types (Based on Access Modes)
ReadWriteOnce (RWO)
Mounted as read-write by one node only

ReadOnlyMany (ROX)
Mounted as read-only by many nodes

ReadWriteMany (RWX)
Mounted as read-write by many nodes

Most clusters only support RWO unless you install NFS or other shared storage like Portworx, Ceph, etc.
Dynamic vs Static PVC Binding
| Method      | Who creates the PV?                                |
| ----------- | -------------------------------------------------- |
| **Dynamic** | Kubernetes via StorageClass (automatic)            |
| **Static**  | You manually create a PV and match it with the PVC |

Example Manifest Set (Dynamic Provisioning)
1️⃣ PVC YAML – Dynamic (via StorageClass)
2️⃣ Pod Using the PVC

Example Manifest Set (Static Provisioning)
1️⃣ Static PersistentVolume (hostPath)
2️⃣ Matching PVC (manual binding)
Tips & Best Practices
| Tip                                                   | Why                                                 |
| ----------------------------------------------------- | --------------------------------------------------- |
| Use `Retain` reclaim policy                           | Keeps data after PVC deletion                       |
| Use `StorageClass`                                    | For dynamic provisioning (e.g., cloud volumes, NFS) |
| Avoid using hostPath in production                    | Not portable and not safe                           |
| Use `ReadWriteMany` only with shared storage like NFS | Default PVs can't support RWX                       |
