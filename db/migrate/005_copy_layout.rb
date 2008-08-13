class CopyLayout < ActiveRecord::Migration

  def self.up
    return if Layout.find_by_name('Beast')

      c =<<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Default - Altered Beast</title>
    <link href="/stylesheets/display.css?1218052425" media="screen" rel="stylesheet" type="text/css" />
    <script src="/javascripts/prototype.js?1218052425" type="text/javascript"></script>
    <script src="/javascripts/effects.js?1218052425" type="text/javascript"></script>
    <script src="/javascripts/lowpro.js?1218052425" type="text/javascript"></script>

    <script src="/javascripts/time.js?1218052425" type="text/javascript"></script>
    <script src="/javascripts/application.js?1218052425" type="text/javascript"></script>
    <link href="/posts.atom" rel="alternate" title="Subscribe to 'Recent Posts'" type="application/atom+xml" />
    <link rel="search" type="application/opensearchdescription+xml" href="http://localhost:3000/open_search.xml" />
  </head>
  <body>

    <div id="header">
      <ul id="nav">
        <li><a href="/" rel="home">Forums</a></li>
        <li><a href="/users">Users</a></li>
        <li id="search">
          <form action="/posts" method="get"><input id="search_box" name="q" size="15" type="text" /></form>
        </li>
        <li><a href="/" id="search-link" onclick="#; return false;">Search</a></li>
        <li><a href="/signup?to=%252F">Signup</a></li>
        <li><a href="/login?to=%252F">Login</a></li>
      </ul>
      <h1><a href="/">Altered Beast</a></h1>
    </div>

    <div id="main">

      <div id="content-wrapper">
        <div id="content">
          <r:content />
        </div>
      </div>

      <div id="sidebar-wrapper">
        <div id="sidebar">
          <r:content part="right" />
        </div>
      </div>

    </div>

  </body>
</html>
EOF
      c << l.content
      Layout.create!(
        :name => 'Beast',
        :content => c
      )
    end
  end

  def self.down
    # Do nothing #
  end

end
