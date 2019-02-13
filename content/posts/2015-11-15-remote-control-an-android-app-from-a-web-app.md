---
date: "2015-11-15T12:51:10+00:00"
draft: false
tags: 
title: "Remote control an android app from a web app"
---
<p><p>When a service does not provide an API but you want to automate repetitive manual tasks you tend to use screen scrapping. You write a program that simply executes the same tasks that one would do manually. There are even great hosted tools out there to get structured data from websites that do not offer an API, for example have a look at <a href="http://www.mozenda.com/">mozenda</a> or <a href="https://www.kimonolabs.com/">kimonolabs</a>. </p><p>For a demo that I have been doing lately I needed the same thing but for a mobile application, actually not even a regular mobile app but a SIM application. After first being stuck with the idea to use some kind of automated testing tools to do that I thought there must be some kind of solution to simulate user input - in this case touch inputs. <br><b>`<i>adb</i> shell` to the rescue.</b> When you have the debug mode enabled on your android phone and if you have the android developer tools installed you can use the <i>adb</i> command to send inputs to the phone. And because it is a command line utility you can simply automate it. It will not allow you to read the content on the screen, but I did not need that. </p><p>So I’ve made a little ruby script that executes the touch inputs by calling adb and a little sinatra HTTP wrapper to connect everything to a web app.<br>A publicly accessible web app sends a HTTP request to a computer that has a connected android and executes the touch inputs.</p>
<p>So as long as you do not need to read what is on the screen this allows you to automate everything on your andorid phone.I could imagine there is a better way to do this, but it worked great for my case.</p>

<strong>Here is some example code:</strong>

<script src="https://gist.github.com/bumi/03f4507b0765442efbae.js"></script></p>