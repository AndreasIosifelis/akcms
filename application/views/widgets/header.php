<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><?= empty($page->title) ? $page["title"] : $page->title ?></title>
        <?= css("foundation") ?>
        <?= css("akcms") ?>
        <?= js("vendor/modernizr") ?>
    </head>
    <body>

        <?php $this->load->view("widgets/mainMenu"); ?>
        <div class="row">
            <div class="large-12 columns">