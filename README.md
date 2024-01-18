```
make up
sudo tee --append /etc/hosts <<< "127.0.0.1 service.default.svc"
sudo tee --append /etc/hosts <<< "127.0.0.1 service-active.default.svc"
make test-service
make test-service-active
```