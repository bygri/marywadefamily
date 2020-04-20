# marywadefamily.org site

## Testing

Docker is required.

Run `docker-compose up` and navigate to `http://127.0.0.1:8000`.

Login to both Omeka and Webtrees with username `test` and password `password`.

## Deploying

The following secrets files need to be mounted into the container.
Use the contents of `test_secrets` as a guide, but edit with your
production configuration.

- `omeka/db.ini`: `/var/www/html/db.ini`
- `omeka/config.ini`: `/var/www/html/application/config.ini`
- `webtrees/config.ini.php`: `var/www/html/webtrees/data/config.ini.php`

It is recommended to mount the following paths into permanent volumes.

- `/var/www/html/files` (Omeka storage)
- `/var/www/html/data/media` (Webtrees storage)

After installation, Omeka needs to have the ImageMagick path set to `/usr/bin`.
You can do this using the Settings tab in Omeka admin.

## Development

The Dockerfile for this deployment takes specified versions of Omeka and
Webtrees, overwrites some files with the contents of the `omeka` and
`webtrees` directories, and deploys them in a container configured with
PHP and Apache.

Custom files, such as themes, plugins or application logic overrides,
should be placed in the `omeka` or `webtrees` directories. As noted above,
they will be added into the release folder structure, overwriting
any existing files.
