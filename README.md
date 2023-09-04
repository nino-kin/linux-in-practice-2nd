# linux-in-practice-2nd

「Linuxのしくみ 増補改訂版」の実験コードです

## How To Use
### Build a Docker image

You can simply setup own development environment based on Ubuntu 20.04 to run he following command.

```console
$ make build
```

If you execute the above command, the Docker container will setup automatically as follows.

```console
$ sudo apt update && sudo apt install binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system
$ sudo adduser `id -un` libvirt
$ sudo adduser `id -un` libvirt-qemu
$ sudo adduser `id -un` kvm
```

### Run a Docker container

```console
$ make run
```

### Run shell

```console
$ make exec
```

### Remove container/image

If you want to remove the Docker container, you can run the following command.

```console
$ make rm
```

If you are still working the container, you can forcibly remove the container to add `-f` option.

```console
$ docker container rm -f linux-practice
```

Also, if you want to remove the Docker image, you can run the following command as well.

```console
$ make rmi
```
