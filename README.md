# FastAPI File Upload API

A simple FastAPI endpoint that accepts file uploads and returns file information.

## Quick Start

### Prerequisites
- Docker or Podman installed

### Running Locally

1. Clone the repository
```bash
git clone <your-repo-url>
cd scratchpad_random_testing
```

2. Build the Docker image
```bash
docker build -t fastapi-upload .
# OR with Podman:
podman build -t fastapi-upload .
```

3. Run the container
```bash
docker run -p 8000:8000 fastapi-upload
# OR with Podman:
podman run -p 8000:8000 fastapi-upload

# If port 8000 is already in use:
docker run -p 8001:8000 fastapi-upload
```

4. Access the API
- **API Documentation**: http://localhost:8000/docs (or http://localhost:8001/docs if using port 8001)
- **Upload Endpoint**: http://localhost:8000/upload-file/

## Testing the Upload Endpoint

### Using the Interactive Docs
1. Go to http://localhost:8000/docs
2. Click on the `/upload-file/` endpoint
3. Click "Try it out"
4. Choose a file and click "Execute"

### Using curl
```bash
curl -X POST -F "file=@/path/to/your/file.pdf" http://localhost:8000/upload-file/
```

### Using Postman
- Method: `POST`
- URL: `http://localhost:8000/upload-file/`
- Body: `form-data`
- Key: `file` (type: File)
- Value: Select your file

## Response Format

Success response (200 OK):
```json
{
  "message": "File accepted successfully",
  "filename": "example.pdf",
  "content_type": "application/pdf",
  "file_size_bytes": 12345
}
```

## Stopping the Container

Press `Ctrl+C` in the terminal where the container is running
