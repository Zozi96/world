import os

class DatabaseConfig:
    HOST: str = os.getenv('DB_HOST', 'localhost')
    PORT: int = os.getenv('DB_PORT', '3306')
    USER: str = os.getenv('DB_USER')
    PASSWORD: str = os.getenv('DB_PASSWORD')
    DB_NAME: str = os.getenv('DB_NAME')

    @classmethod
    def get_db_uri(cls):
        return f'mysql+pymysql://{cls.USER}:{cls.PASSWORD}@{cls.HOST}:{cls.PORT}/{cls.DB_NAME}'

class Settings:
    DEBUG = os.getenv('DEBUG', False)
    ENV = os.getenv('ENV', 'production')
    SECRET_KEY = os.getenv('SECRET_KEY', 'secret')
    SQLALCHEMY_DATABASE_URI = DatabaseConfig.get_db_uri()
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
