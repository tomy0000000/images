# Debian

1. Download install script

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```

2. Execute install script

```bash
sudo sh get-docker.sh
```

3. Install Docker Compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

4. Grant user docker command permission (Optional)

```bash
sudo usermod -aG docker $(whoami)
```

