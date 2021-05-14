<?php

define('MATOMO_PLUGIN_VERSION', get_plugin_ini('OmekaMatomo', 'version'));
define('MATOMO_PLUGIN_DIR', dirname(__FILE__));
define('MATOMO_WEBSITE_ID', 'matomo_website_id');
define('MATOMO_URL', 'matomo_url');

class OmekaMatomoPlugin extends Omeka_Plugin_AbstractPlugin
{
    protected $_hooks =array(
        'install',
        'uninstall',
        'public_head',
        'config',
        'config_form'
    );

    protected $_filters = array();

    public function hookInstall()
    {
        set_option('matomo_version', MATOMO_PLUGIN_DIR);
    }

    public function hookUninstall()
    {
        delete_option('matomo_version');
        delete_option(MATOMO_WEBSITE_ID);
        delete_option(MATOMO_URL);
    }

    public function hookPublicHead()
    {
        $websiteId = get_option(MATOMO_WEBSITE_ID);
        $url = get_option(MATOMO_URL);
        if (empty($websiteId) || empty($url)) {
            return;
        }

        $js = file_get_contents(MATOMO_PLUGIN_DIR . '/matomo.js');
        $js = str_replace('MATOMO_WEBSITE_ID', $websiteId, $js);
        $js = str_replace('MATOMO_URL', $url, $js);

        echo $js;
    }

    public function hookConfig($args)
    {
        $post = $args['post'];
        set_option(
            MATOMO_WEBSITE_ID,
            $post[MATOMO_WEBSITE_ID]
        );
        set_option(
            MATOMO_URL,
            $post[MATOMO_URL]
        );
    }

    public function hookConfigForm()
    {
       include MATOMO_PLUGIN_DIR . '/config_form.php';
    }
}
