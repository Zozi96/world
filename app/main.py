from werkzeug.utils import import_string

from modules import create_app

config = import_string('modules.configs.Settings')()

app = create_app(config=config)

if __name__ == '__main__':
    app.run(debug=True)
