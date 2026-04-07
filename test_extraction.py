import PyPDF2
import os

def test_extraction():
    file_path = r"c:\Internmatrix_Backend\uploads\resumes\user_1_kondareddy_resume.pdf"
    if not os.path.exists(file_path):
        print("File not found.")
        return

    try:
        reader = PyPDF2.PdfReader(file_path)
        text = ""
        for page in reader.pages:
            page_text = page.extract_text()
            if page_text:
                text += page_text + "\n"
        
        print(f"Extracted {len(text)} characters.")
        print("First 100 characters:")
        print(text[:100])
        
        if len(text.strip()) == 0:
            print("ERROR: Extracted text is empty.")
        else:
            print("SUCCESS: Text extraction working.")
            
    except Exception as e:
        print(f"Extraction failed: {e}")

if __name__ == "__main__":
    test_extraction()
