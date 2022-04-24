package main

import (
	"fmt"
	"net/http"
)

func main() {
	router := http.NewServeMux()

	fs := http.FileServer(http.Dir("./ui/build"))

	router.Handle("/", fs)
	router.Handle("/static/", http.StripPrefix("/static/", fs))

	fmt.Println("Listening on port 8080")
	http.ListenAndServe(":8080", router)
}
