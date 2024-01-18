package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	fmt.Println("starting server")
	certPath := os.Getenv("CERT_PATH")
	keyPath := os.Getenv("KEY_PATH")
	if certPath == "" {
		panic("CERT_PATH not set")
	}
	if keyPath == "" {
		panic("KEY_PATH not set")
	}

	err := http.ListenAndServeTLS(":8080", certPath, keyPath, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, world!"))
	}))
	panic(err)
}
