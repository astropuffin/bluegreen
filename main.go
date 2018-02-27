package main

import (
	"os"
    "fmt"
    "log"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	color := os.Getenv("COLOR")
    fmt.Fprintf(w, "%s",color)
	//fmt.Fprintf(w, color, r.URL.Path[1:])
}

func main() {
    http.HandleFunc("/", handler)
    log.Fatal(http.ListenAndServe(":8080", nil))
}
