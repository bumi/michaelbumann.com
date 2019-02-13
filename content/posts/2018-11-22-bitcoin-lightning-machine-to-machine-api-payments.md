---
date: "2018-11-22T21:45:10+00:00"
draft: false
tags: ["bitcoin", "lightning", "API", "payments"]
title: "Bitcoin lightning machine-to-machine API payments"
---
<p>The Bitcoin lightning network is growing quickly. The lightning network is an exciting second layer protocol on top of the Bitcoin network that allows to send real near-instant payments and is perfectly suited for micro-/nano-transactions. <br></p><p>The tools already work great and make it super easy for developers to integrate with the lightning network. <br></p><p>I’ve lately experimented with it and built a demo to show machine-to-machine API payments. It allows the server to request a payment from the client; the client can automatically pay the invoice to access the resource from the server.<br></p><p>The basic workflow is as follows:</p><ol><li>Client sends a request to the server</li><li>Server response with an invoice</li><li>Client pays and sends a proof to the server</li><li>Server responds with the requested resource</li></ol><p>To make it easy for the developer all this can happen in the background so the payment logic can be abstracted and hidden from the developer. <br></p><p>Here is a small ruby application that exposes an endpoint to convert markdown to pdf but requires the client to pay 100 satoshi (currently 0.44 cent) per request. <br></p><p>You can find the <a href="https://github.com/bumi/ln-markdown-to-pdf">code here on GitHub.</a> And I made a short <a href="https://vimeo.com/302338717">video showing how it works</a>: <br></p>
<iframe src="https://player.vimeo.com/video/302338717" width="640" height="360" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>

<h3>Introducing rack-lightning</h3>
<p>To make it easy for every ruby developer to add lightning payment requests to any ruby application I've written <a href="https://github.com/bumi/rack-lightning">rack-lightning</a>.</p>
<p>rack-lightning is a <a href="https://rack.github.io/">rack</a> middleware that handles the lightning invoice creation and validation on the server.</p><p>
</p><p>
A full <a href="https://github.com/bumi/rack-lightning#usage">usage example</a> can be found on GitHub, but it is not more than adding one line of rack code: 

</p><pre>
<code>
use Rack::Lightning, { price: 100 } 
</code>
</pre>



<p>Have a look at the <a href="https://github.com/bumi/rack-lightning">GitHub page for more information</a>.</p>
<p><br></p>
<h3>Introducing lightning faraday middleware</h3>
<p>
And to make it easy on the client side I've written a <a>faraday</a> middleware that handles the payment requests on the client: <a href="https://github.com/bumi/faraday_ln_paywall/">faraday_ln_paywall</a>
</p>

<p>The middleware handles the payment of the invoice. Her is a quick useage example: 
</p><pre>
<code>
# initialize a client
client = Faraday.new(:url =&gt; 'https://lightning-2pdf.herokuapp.com/') do |faraday|
  faraday.use FaradayLnPaywall::Middleware, { max_amount: 100 }
  faraday.adapter  Faraday.default_adapter
end

# use the client to do API calls:
puts client.post("/convert/pdf", "# Hallo Welt").body
</code>
</pre>

<p>
Head over to the <a href="https://github.com/bumi/faraday_ln_paywall/">GitHub repository for more information</a>.</p>

<p><br></p>
<h3>Similar projects</h3>
<p>A few years back I did something <a href="http://michaelbumann.com/post/141356263577/experimenting-with-bitcoin-machine-to-machine">similar with pure bitcoin</a>.
</p>
<p>
And an exciting project is <a href="https://lightning.ws/">lightning.ws</a> that does something similar in Go
</p>