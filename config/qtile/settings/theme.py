import json
from os import path

from .path import qtile_path


def load_theme():
    default_theme = "dracula"

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            default_theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme": "{default_theme}"}}\n')

    theme_file = path.join(qtile_path, "themes", f"{default_theme}.json")
    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(path.join(theme_file)) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()
