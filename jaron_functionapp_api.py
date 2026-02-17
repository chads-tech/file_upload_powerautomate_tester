from fastapi import FastAPI, File, UploadFile
from fastapi.responses import JSONResponse

app = FastAPI()


@app.post("/upload-file/")
async def upload_file(file: UploadFile = File(...)):
    """
    Endpoint to accept any file upload.
    
    Args:
        file: The uploaded file
        
    Returns:
        200 OK response if file is accepted
    """
    # Read file to get size
    contents = await file.read()
    file_size = len(contents)
    
    # File is accepted - return 200 OK
    return JSONResponse(
        status_code=200,
        content={
            "message": "File accepted successfully",
            "filename": file.filename,
            "content_type": file.content_type,
            "file_size_bytes": file_size
        }
    )


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
