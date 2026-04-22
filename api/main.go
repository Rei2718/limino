package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	db := connectDB()
	defer db.Close()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Hello, Limino. CI/CD is working!!")
	})

	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		err := db.Ping()
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			fmt.Fprintf(w, "DB connection failed: %v", err)
			return
		}
		fmt.Fprintln(w, "ok: DB connection successful")
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	fmt.Println("Server starting on port " + port)
	http.ListenAndServe(":"+port, nil)
}
