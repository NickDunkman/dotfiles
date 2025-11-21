/**
 * This file is used to set Firefox preferences, which can also manually be
 * set via the about:config page inside Firefox.
 *
 * It's symlinked into each Firefox profile at:
 *
 *   <firefox profile>/user.js
 */

// don't be warned when trying to open about:config
user_pref("general.warnOnAboutConfig", false);

// enable userChrome.css for browser styling customizations
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
