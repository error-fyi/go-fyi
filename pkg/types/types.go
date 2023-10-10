//go:generate rm -f ./v0.1.0/schema.json ./v0.1.0/types.go
//go:generate wget -O ./v0.1.0/schema.json https://raw.githubusercontent.com/error-fyi/fyi-schema/main/v0.1.0/schema.json --quiet
//go:generate go run github.com/atombender/go-jsonschema ./v0.1.0/schema.json -p v0_1_0 -o ./v0.1.0/types.go
package types
