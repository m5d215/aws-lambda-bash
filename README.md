# aws-lambda-bash

Execute bash script on AWS Lambda with custom runtime.

## Usage

```bash
make build
```

- Create a new Lambda layer and upload `build/layer.zip`.
- Create a new Lambda function and upload `build/hello.zip`.
