package main

import (
	"log"
	"time"
)

func main() {
	count := 0
	for {
		time.Sleep(1 * time.Second)
		if (count % 2) == 1 {
			log.Println("badger")
		} else {
			log.Println("mushroom")
		}
	}
}
