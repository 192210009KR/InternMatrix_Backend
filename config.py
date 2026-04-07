import os

class Config:
    # Flask Settings
    FLASK_HOST = '0.0.0.0'
    FLASK_PORT = 5000
    DEBUG = True

    # Database Settings
    DB_HOST = 'localhost'
    DB_USER = 'root'
    DB_PASSWORD = ''  # Update this with your DB password
    DB_NAME = 'internmatrix'

    # SMTP Settings (Gmail)
    SMTP_HOST = 'smtp.gmail.com'
    SMTP_PORT = 587
    SMTP_USER = 'internmatrixx@gmail.com'
    SMTP_APP_PASSWORD = 'zcwipexpuhwchqgc'  # Updated to correct App Password

    # NCS API Settings
    NCS_API_HOSTNAME = 'www.ncs.gov.in'
    NCS_BETA_API_HOSTNAME = 'betacloud.ncs.gov.in'

    # AI Service Keys (Gemini)
    AI_KEYS = [
        "AIzaSyDcjF_0JVM93Fh_fMEAoUqsmmjPUE2TLw8",
        "AIzaSyD8AOP0iMXvkNc2ZQXSs6AuFAA6-o0xIyI",
        "AIzaSyCuvx2QRo5UAr5VZ2eqTQuiJUWSD7-vz2w",
        "AIzaSyCBFXHOzYLnjQq4s8RdwyKIRbvbine6JYM",
        "AIzaSyAV6LCwGVRX4W3VvA6pnlCXXO1Cn8gr3Qo"
    ]
