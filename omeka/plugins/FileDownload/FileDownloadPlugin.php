<?php

class FileDownloadPlugin extends Omeka_Plugin_AbstractPlugin
{
    private static $types = array('application/pdf', 'application/x-pdf');
    private static $exts = array('pdf');

    protected $_hooks = array('initialize');

    public function hookInitialize()
    {
        add_file_display_callback(
            array(
                'mimeTypes' => self::$types,
                'fileExtensions' => self::$exts
            ),
            'FileDownloadPlugin::addDownloadLink'
        );
    }

    public static function addDownloadLink($file, $options)
    {
        $pdfPath = $file->getWebPath('original');
        return '<div class="element-text"><a download href="' . html_escape($pdfPath) . '">Download ' . metadata($file, 'display_title') . '</a></div>';
    }
}
