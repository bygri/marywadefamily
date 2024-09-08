<?php $view = get_view(); ?>

<div id="umami_form">
  <div>
    <?php
    echo $view->formLabel(UMAMI_WEBSITE_ID, 'Umami Website ID:');
    echo $view->formText(
      UMAMI_WEBSITE_ID,
      get_option(UMAMI_WEBSITE_ID),
      array('rows' => '15', 'cols' => '80')
    );
    ?>
  </div>
  <div>
    <?php
    echo $view->formLabel(UMAMI_URL, 'Umami URL:');
    echo $view->formText(
      UMAMI_URL,
      get_option(UMAMI_URL),
      array('rows' => '15', 'cols' => '80')
    );
    ?>
  </div>
</div>
