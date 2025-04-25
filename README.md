# OpenCart 3.0.3.9 Docker Installation

## Prerequisites

Before starting the installation, please add the following line to your hosts file:

```
127.0.0.1 danial-uk.loc
```

To edit the hosts file:
1. Open Notepad as Administrator
2. Open the file: `C:\Windows\System32\drivers\etc\hosts`
3. Add the line above and save

## Installation Steps

1. Run Docker Compose:
   ```
   docker-compose up -d
   ```

2. Access PHPMyAdmin at: http://localhost:8081
   - Login with:
     - Username: root
     - Password: Konurul2025

3. Start OpenCart installation at: http://danial-uk.loc:8090
   - Use the following database details:
     - Database Host: db
     - Database Name: opencart_db
     - Database User: root
     - Database Password: Konurul2025
   - Admin details:
     - Username: danial_user
     - Password: Konurul2025
     - Email: danial.unitedkingdom@gmail.com

4. After successful installation, remove the install directory:
   ```
   docker exec opencart_web rm -rf /var/www/html/install
   ```

## Stopping the Application

To stop the containers:
```
docker-compose down
``` 