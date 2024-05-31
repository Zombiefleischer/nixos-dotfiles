{...}: {
  xdg.desktopEntries.vivaldi-stable = {
    name = "Vivaldi";
    genericName = "Web Browser";
    comment = "Access the Internet";
    exec = "/etc/profiles/per-user/zombiefleischer/bin/vivaldi %U";
    icon = "vivaldi";
    terminal = "false";
    type = "Application";
    categories = ["Network" "WebBrowser"];
    mimeType = ["text/html" "image/webp" "image/png" "image/jpeg" "image/gif" "application/xml" "application/xhtml+xml" "application/rss+xml" "application/rdf+xml" "application/pdf"];
    actions = {
      "new-window" = {
        name = "New Window";
        exec = "/etc/profiles/per-user/zombiefleischer/bin/vivaldi --new-window";
      };
      "new-private-window" = {
        name = "New Private Window";
        exec = "/etc/profiles/per-user/zombiefleischer/bin/vivaldi --incognito";
      };
    };
  };
}
