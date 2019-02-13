---
date: "2018-11-03T18:53:28+00:00"
draft: false
tags: ["OpenAlias", "Monero", "Bitcoin", "ruby", "rust"]
title: "OpenAlias lookup with ruby"
---
<p>Halloween nights are scary and you are supposed to do scary things. This year I had a few hours in the hotel and so I've built a ruby wrapper around the <a href="https://github.com/nabijaczleweli/openalias.rs">openalias.rs rust package</a>. That is scary because I have no idea about rust :D</p><p>But fist things first, <b>what is OpenAlias?<br></b><a href="https://openalias.org/">OpenAlias</a> is an open standard for simpler addresses for any crypto currencies.<br>It is a DNS based alias system that allows you to use a domain to lookup a cryptocurrency address. So for example, if your wallets supports it (e.g. Electrum) you can simply send Bitcoin to “michaelbumann.com” instead of my Bitcoin address. <br></p><blockquote><p>
At its most basic, OpenAlias is a TXT DNS record on a FQDN (fully qualified domain name). 
By combining this with DNS-related technologies [it has] created an aliasing standard that is extensible for developers, 
intuitive and familiar for users, and can interoperate with both centralised and decentralised domain systems.

</p></blockquote><p>Find more details on the <a href="https://openalias.org/"><b>OpenAlias.org website</b></a></p><p><b>What did I built?</b>
For rust there is a package that does the DNS lookup and parsing of the OpenAlias entries. But we should have one for any language to make it easy for developers to integrate OpenAlias. That's why I made this <a href="https://rubygems.org/gems/openalias">ruby gem</a> that ruby developers can use in their apps and use OpenAlias. <br>
Right now it is using the rust library as a native extension, but at some point I might write a pure ruby one.</p><p><b>Have a look at <a href="https://github.com/bumi/openalias-ruby">bumi/openalias-ruby on GitHub.</a></b><br></p>