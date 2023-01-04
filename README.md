<p align="center">
    <h1 align="center">k8s-express-js</h1>
</p>

<p align="center">
  <a aria-label="Kubernetes logo" href="https://vercel.com">
    <img src="https://img.shields.io/badge/v1.24.1-000.svg?style=for-the-badge&logo=Kubernetes&labelColor=000">
  </a>
  <a aria-label="Docker version" href="https://www.docker.com/">
    <img alt="" src="https://img.shields.io/badge/v20.10.17-000.svg?style=for-the-badge&logo=docker&labelColor=000">
  </a>
  <a aria-label="Node version" href="https://nodejs.org/">
    <img alt="" src="https://img.shields.io/badge/v18.12.1-000.svg?style=for-the-badge&logo=nodedotjs&labelColor=000">
  </a>
  <a aria-label="License" href="https://github.com/dmaax/k8s-express-js/blob/main/LICENSE">
    <img alt="" src="https://img.shields.io/github/license/dmaax/k8s-express-js?style=for-the-badge&labelColor=000000">
  </a>
</p>

# Creating a k8s cluster w/ minikube
<p> All instructions on creating a deployment (k8s) of a nodejs app.</p>
<br>

## Creating a deployment

```
k create deployment k8s-web-hello --image=dmaax/k8s-hello-from-express
```
<br>

## Scaling up
```
k scale deployment k8s-web-hello --replicas=10
```
<br>


<p>There are 3 ways to expose this deployment</p>

1. [ClusterIP](#exposing-with-clusterip)
2. [NodePort](#exposing-with-nodeport)
3. [LoadBalancer](#exposing-with-loadbalancer)

<br>

## Exposing with ClusterIP
```
k expose deployment k8s-web-hello --port=80 --target-port=3000
```
<br>

## Exposing with NodePort
```
k expose deployment k8s-web-hello --type=NodePort --port=3000
```
<br>

## Exposing with LoadBalancer
```
k expose deployment k8s-web-hello --type=LoadBalancer --port=3000
```
<br>

## Update a deployment with a newer docker image
```
k set image deployment k8s-web-hello k8s-hello-from-express=dmaax/k8s-hello-from-express:1.0.0
```
<br>

## Monitor the update process
```
k rollout status deploy k8s-web-hello
```
<br>

<hr>

## Deleting a pod
```
k delete pod k8s-web-hello-6fb86f54fd-8ldcq
```
*This pod is going to be recreated automatically, with another name.*
<br>

## Accessing k8s dashboard
```
minikube dashboard
```
*This method may vary, this works if you're using minikube like me.*