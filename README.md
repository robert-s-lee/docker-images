
login
```
echo $CR_PAT | docker login ghcr.io -u robert-s-lee --password-stdin
```


```bash
docker push robertslee/grid-tf-aws:latest

docker push ghcr.io/robert-s-lee/grid-tf-aws:latest


docker pull robertslee/grid-tf-aws:latest
