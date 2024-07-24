Explanation
Nginx Deployment:

The deployment creates 5 replicas of the Nginx web server.
It includes pod anti-affinity rules to spread replicas across different nodes for improved availability.
Resource requests and limits are defined to manage CPU and memory usage.

Horizontal Pod Autoscaler (HPA):

The HPA monitors the CPU utilization of the Nginx deployment.
It automatically scales the number of replicas between 5 and 20 based on the specified metrics.
The target utilization is set to 80% for CPU.
