#!/bin/bash

set -x

exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'

echo "Installing download utility..."
yum -y install wget

echo "Downloading go binary..."
wget -qO- https://storage.googleapis.com/golang/go${version}.${os}-${arch}.tar.gz | tar xvz -C /usr/local/

echo "Adding go to PATH..."
export PATH=$PATH:/usr/local/go/bin

echo "Copying go application source code..."
cat > /tmp/app.go <<EOL
package main
import (
    "fmt"
    "net/http"
    "os"
)
func handler(w http.ResponseWriter, r *http.Request) {
    h, _ := os.Hostname()
    fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8484", nil)
}
EOL

chmod 755 /tmp/app.go

echo "Starting go application..."
go run /tmp/app.go &

exit 0
