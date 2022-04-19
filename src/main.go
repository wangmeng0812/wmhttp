package main

import "net/http"

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("hello, wmhttp"))
	})
	http.ListenAndServe(":8888", nil)
}
