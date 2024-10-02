## Project Overview

Inception 42 is a system administration exercise focused on creating a small infrastructure using Docker. This project aims to deepen understanding of system administration concepts through practical application.

## Key Components

1. **Virtual Machine**: The entire project is set up on a virtual machine.

2. **Docker and Docker Compose**: Used for creating and managing containers.

3. **Custom Docker Images**: Self-created Dockerfiles for each service, built from Alpine or Debian (penultimate stable version).

4. **Services/Containers**:
   - NGINX with TLSv1.2 or TLSv1.3
   - WordPress + php-fpm
   - MariaDB

5. **Volumes**:
   - WordPress database
   - WordPress website files

6. **Docker Network**: Establishes connections between containers.

7. **Domain Configuration**: Set up `login.42.fr` pointing to the local IP address.

## Security Measures

- NGINX as the only entrypoint (port 443)
- Use of environment variables (preferably in a `.env` file)
- No passwords in Dockerfiles

## Project Structure

- **Makefile**: Sets up the entire application using `docker-compose.yml`
- **Directory Structure**: Includes a 'srcs' folder for configuration files

## Bonus Features

- Redis cache
- FTP server
- Static website (non-PHP)
- Adminer
- Additional useful service (implementer's choice)

## Key Emphases

- Proper Docker practices
- Security considerations
- Multi-container application implementation using Docker Compose

# Skill and technology

- Docker
- Docker-compose
- microservice
- Nginx
- SQL
- shell script
- Php
- adminer
- Wordpress
- SSL
- FTP
- SSH
- redis
- mariadb
- DevOps

## Getting Started

```bash
git clone https://github.com/abouramd/Inception_42.git

cd Inception_42

cd src

cp .env.example .env

vim .env # edit the .env file with your own configuration

sudo  echo "127.0.0.1    abdelhay.42.fr" >> /etc/hosts # add the hostname that you choose in your loop back

cd .. 

make
```

## Acknowledgments

This project is part of the curriculum at 42 School.