---
date: "2016-03-07T17:46:05+00:00"
draft: false
tags: ["bitcoin", "bip70", "payments"]
title: "Example client/server implementing of the Bitcoin Payment Protocol (BIP70)"
---
<p>I&rsquo;ve been experimenting with different possibilities to integrate Bitcoin payments into applications and websites. I believe payments must become easier and bitcoin provides some great possibilities there.&nbsp;</p><p>In the following post looks into the Bitcoin Payment Protocol (BIP70) and shows some code for a simple server implementation (in Ruby) and a client/wallet implementation (in Java).&nbsp;</p><p><b>What is the Payment Protocol?&nbsp;</b></p><p>The Payment Protocol, described in Bitcoin Improvement Proposal 70, is a protocol for communicating between the customer&rsquo;s Bitcoin wallet/client and the merchant&rsquo;s server application. It greatly improves the checkout experience for the user.
The user does not have to deal with bitcoin addresses but simply opens his wallet with a Payment Request from the merchant (for example by clicking on a link) the wallet gets the needed information for the payment from the merchant&rsquo;s server. The user confirms the payment and the wallet notifies the server about the payment.&nbsp;</p><p>Besides optimizing the user experience the Payment Protocol also describes a process for refunds or exchanging additional data or notes.&nbsp;</p><p><a href="https://github.com/bitcoin/bips/blob/master/bip-0070.mediawiki"></a></p><a href="https://github.com/bitcoin/bips/blob/master/bip-0070.mediawiki"><figure class="tmblr-full" data-orig-height="502" data-orig-width="795" data-orig-src="https://github.com/bitcoin/bips/raw/master/bip-0070/Protocol_Sequence.png"><img src="/img/2016-03-07-example-clientserver-implementing-of-the-bitcoin-payment-protocol-bip70/eeeb6f8fd3d8d299ec7406a13d0224cf7ad0d71b4af28daa7225e9a63432100b.png" alt="Payment Protocol sequence diagram" data-orig-height="502" data-orig-width="795" data-orig-src="https://github.com/bitcoin/bips/raw/master/bip-0070/Protocol_Sequence.png"></figure></a><p></p><p><b>Wallet implementation</b></p><p>I am using <a href="http://bitcoinj.org">bitcoinj</a> for most apps working with the bitcoin protocol. It has pretty <a href="https://bitcoinj.github.io/payment-protocol">good support for BIP70</a>.
</p><p>We will give the wallet a <a href="https://github.com/bitcoin/bips/blob/master/bip-0072.mediawiki">BIP72 bitcoin URL</a> which contains the URL of th payment request (see server implementation). Once received we parse and validate the request. The validation is done using a X.509 certificate.</p><p>When the user has confirmed the payment we create one or more transactions to fulfull the payment request and send these back to the merchant. The merchant validates the transaction, publishes them to the Bitcoin network and sends a confirmation (ACK) back to the user.</p>

<p>The code might be a bit hard to read on the blog here, have a look at the <a href="https://github.com/bumi/bip70-example">BIP70 example GitHub repo</a>. And have a look a the comments for code explanation.</p>

<p><b>Let's get to the wallet code!</b></p>
<code data-gist-id="7cf797bc084a23a98023" data-gist-hide-line-numbers="true" data-gist-file="wallet.java">
<a href="https://github.com/bumi/bip70-example/blob/master/wallet.java">wallet.java</a>
</code>

<p><b>Server implementation</b></p>
<p>Now let's look on the merchant side of things. Here I am using Ruby, but the code is pretty straight forward and should look pretty similar in your favorit language.</p>

<p>We basically need two endpoints:<br>
One for generating the payment request which is requested by the wallet in the first step. <br>
And a second one for accepting the payment and the payment ack.
</p>
<p><a href="https://developers.google.com/protocol-buffers/">Protocol buffers</a> are used for the communication. In our example we use the gem <a href="https://rubygems.org/gems/ruby-protocol-buffers">"protocol_buffers"</a> for parsing and generating these (have a look in the BIP for the <a href="https://github.com/bitcoin/bips/blob/master/bip-0070.mediawiki">details</a>)
</p>
<p><b>OK, let's look at the code:</b></p>
<code data-gist-id="7cf797bc084a23a98023" data-gist-hide-line-numbers="true" data-gist-file="server.rb">
<a href="https://github.com/bumi/bip70-example/blob/master/server.rb">server.rb</a>
</code>

<p><a href="https://github.com/bumi/bip70-example">You find all sources in the GitHub repository</a>.</p>

<p><b>Conclusion</b></p>

<p>
The BIP 70 Payment Protocol improves the user experience for payments and solves the issue that the user sees who whe is paying and that he gets an immediete response from the merchant if he received the payment. <br>
Most Bitcoin Payment Service Provides support the protocol. But experiment with it! It is easy to implement in your application/website to accept payments.
</p>
<p>Update: btw. here is a good <a href="https://www.youtube.com/watch?v=bGj7TBD_Pfo">BIP70 introduction video</a></p>