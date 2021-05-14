<?php $view = get_view(); ?>

<div id="matomo_form">
  <div>
    <?php
    echo $view->formLabel(MATOMO_WEBSITE_ID, 'Matomo Website ID:');
    echo $view->formText(
      MATOMO_WEBSITE_ID,
      get_option(MATOMO_WEBSITE_ID),
      array('rows' => '15', 'cols' => '80')
    );
    ?>
  </div>
  <div>
    <?php
    echo $view->formLabel(MATOMO_URL, 'Matomo URL:');
    echo $view->formText(
      MATOMO_URL,
      get_option(MATOMO_URL),
      array('rows' => '15', 'cols' => '80')
    );
    ?>
  </div>
</div>
