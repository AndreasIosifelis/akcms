<div class="row">
    <div class="large-12 columns">
        <nav class="top-bar" data-topbar>
            <ul class="title-area">
                <li class="name">
                    <h1><?=anchor("", "My Site")?></h1>
                </li>
                <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
                <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
            </ul>

            <section class="top-bar-section">
                <!-- Left Nav Section -->
                <ul class="left">
                    <li><?=anchor("page/home", HOME)?></li>
                    <li><?=anchor("page/contact", CONTACT)?></li>
                </ul>
                <!-- Right Nav Section -->
                <ul class="right">
                    <?php $this->load->view("widgets/cartMenuItem") ?>
                    <li><?=anchor("user/profile", "Account")?></li>
                </ul>
            </section>
        </nav>
    </div>
</div>