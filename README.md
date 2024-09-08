# marywadefamily.org site

## Testing

Docker is required.

Run `docker-compose up` and navigate to `http://127.0.0.1:8000`.

Login to both Omeka and Webtrees with username `test` and password `password`.

## Deploying

It is recommended to mount the following paths into permanent volumes.

- `/var/www/html/files` (Omeka storage)
- `/var/www/html/data` (Webtrees storage)

The following secrets files need to be mounted into the container.
Use the contents of `test_secrets` as a guide, but edit with your
production configuration.

- `omeka/db.ini`: `/var/www/html/db.ini`
- `omeka/config.ini`: `/var/www/html/application/config/config.ini`
- `webtrees/config.ini.php`: `/var/www/html/webtrees/data/config.ini.php`

In these files, Omeka is configured to use GD rather than ImageMagick
(the default). If you want to use ImageMagick, then you will need to
add `apt-get install imagemagick` to the image, and then after installation,
set the ImageMagick path to `/usr/bin` in the Settings tab in the Omeka
admin console.

Apache serves HTTP. If deploying behind SSL, make sure to set the `base_url`
in secret `webtrees/config.ini.php` to an HTTPS url, e.g.
`https://www.marywadefamily.org/webtrees/login.php`.

## Development

The Dockerfile for this deployment takes specified versions of Omeka and
Webtrees, overwrites some files with the contents of the `omeka` and
`webtrees` directories, and deploys them in a container configured with
PHP and Apache.

Custom files, such as themes, plugins or application logic overrides,
should be placed in the `omeka` or `webtrees` directories. As noted above,
they will be added into the release folder structure, overwriting
any existing files.

### Installed plugins

- [PDF Embed](https://github.com/zerocrates/PdfEmbed) v1.2, John Flatness
- [SimpleContactForm](https://github.com/omeka/plugin-SimpleContactForm) v1.1.1, Roy Rosenzweig Center for History & New Media
- [Sitemap 2](https://github.com/UCSCLibrary/Sitemap) v2.3, UC Santa Cruz University Library
- FileDownload, by Toby Griffin
- OmekaMatomo, by Toby Griffin
- OmekaUmami, by Toby Griffin
