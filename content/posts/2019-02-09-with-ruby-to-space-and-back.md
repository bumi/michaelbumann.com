---
date: "2019-02-09T21:50:54+00:00"
draft: false
tags: ["ruby", "bitcoin", "satellite", "blockstream", "lightning"]
categories: ["bitcoin"]
title: "With ruby to space and back"
---
<p>It is pretty amazing to live in a time when it is possible to broadcast data through satellites to pretty much the whole planet. The <a href="https://blockstream.com/satellite/">Blockstream Satellite project</a> makes this possible. </p><figure class="tmblr-full" data-orig-height="826" data-orig-width="900"><img src="/img/2019-02-09-with-ruby-to-space-and-back/86092fecb52afbbb4b60a0b4e117ddd4161937bfc2872fc79dc61291dcfc35d4.png" data-orig-height="826" data-orig-width="900" alt="image"></figure><p>Their Satellite network not only broadcasts the Bitcoin blockchain around the world 24/7 for free but also provides an <a href="https://blockstream.com/satellite-api/">API</a> that allows <b>everybody</b> to broadcast messages through this network. This is possible for for a small fee payable through the <a href="http://lightning.network/">Bitcoin lightning network</a>. <br></p><p>To make it easy to broadcast messages from any ruby application I’ve written the <a href="http://github.com/bumi/blockstream_satellite">blocksteam satellite gem</a>.</p><p>The ruby package sends broadcast orders to the API and uses a connected lightning (lnd) node to pay for the order. <br></p><p>Check out the <a href="https://github.com/bumi/blockstream_satellite#quick-example">quick example</a>: <br></p><p>

<pre>

require "blockstream_satellite"

order = BlockstreamSatellite::Order.create(path: '/path/to/file')

puts order.status #=> pending
order.pay # sends the lightning payment using the configured lnd client

puts order.status #=> transmitting
order.refresh
puts order.status #=> sent

</pre>
</p>

<p>Have fun using ruby to send data to space and back!</p>