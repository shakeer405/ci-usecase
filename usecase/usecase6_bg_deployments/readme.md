What is Blue-Green Deployment?
Blue-Green Deployment is a strategy where two identical environments (Blue and Green) exist.
At any time, only one is live (serving traffic). The other can be updated/tested, then traffic is switched.

Blue: Current live version

Green: New version you're deploying

After testing Green, switch traffic from Blue to Green.

Advantages:
| Feature       | Benefit                                     |
| ------------- | ------------------------------------------- |
| Zero-downtime | Users always hit a working version          |
| Easy rollback | Just switch traffic back to the old version |
| Safe testing  | Test Green deployment before switching live |

Structure
We use:

Two Deployments: myapp-blue and myapp-green

One Service: myapp-service, points to only one version (based on label)

Structure
We use:

Two Deployments: myapp-blue and myapp-green

One Service: myapp-service, points to only one version (based on label)

Kubernetes YAML Example:
1️⃣ myapp-blue.yaml
2️⃣ myapp-green.yaml
3️⃣ myapp-service.yaml

How Blue-Green Works in Kubernetes
Step-by-Step:
✅ Step 1: Deploy the Blue Version

kubectl apply -f myapp-blue.yaml
kubectl apply -f myapp-service.yaml
Users now hit:

myapp-service -> myapp-blue
✅ Step 2: Deploy the Green Version (new version)

kubectl apply -f myapp-green.yaml
Now both versions exist, but traffic still flows to Blue.

✅ Step 3: Switch Service to Green
Edit the service:

spec:
  selector:
    app: myapp
    version: green
Best Practices
Use a test namespace or hidden endpoint for verifying green before switching.

Automate switching using Helm or ArgoCD.

Clean up unused environments to save resources.