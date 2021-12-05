REPO="vikramchauhan/wordpress"
docker build -f ./5-php7.4-apache.Dockerfile -t "$REPO":5-php7.4-apache -t "$REPO" . --platform linux/amd64