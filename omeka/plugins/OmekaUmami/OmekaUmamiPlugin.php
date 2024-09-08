<?php

define('UMAMI_PLUGIN_VERSION', get_plugin_ini('OmekaUmami', 'version'));
define('UMAMI_PLUGIN_DIR', dirname(__FILE__));
define('UMAMI_WEBSITE_ID', 'umami_website_id');
define('UMAMI_URL', 'umami_url');

class OmekaUmamiPlugin extends Omeka_Plugin_AbstractPlugin
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
        set_option('umami_version', UMAMI_PLUGIN_DIR);
    }

    public function hookUninstall()
    {
        delete_option('umami_version');
        delete_option(UMAMI_WEBSITE_ID);
        delete_option(UMAMI_URL);
    }

    public function hookPublicHead()
    {
        $websiteId = get_option(UMAMI_WEBSITE_ID);
        $url = get_option(UMAMI_URL);
        if (empty($websiteId) || empty($url)) {
            return;
        }

        $js = file_get_contents(UMAMI_PLUGIN_DIR . '/umami.js');
        $js = str_replace('UMAMI_WEBSITE_ID', $websiteId, $js);
        $js = str_replace('UMAMI_URL', $url, $js);

        echo $js;
    }

    public function hookConfig($args)
    {
        $post = $args['post'];
        set_option(
            UMAMI_WEBSITE_ID,
            $post[UMAMI_WEBSITE_ID]
        );
        set_option(
            UMAMI_URL,
            $post[UMAMI_URL]
        );
    }

    public function hookConfigForm()
    {
       include UMAMI_PLUGIN_DIR . '/config_form.php';
    }
}
