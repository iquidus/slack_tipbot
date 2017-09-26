
# Slack Tipbot

#### coin-agnostic crypto Tipbot for [Slack](https://slack.com)

## Setup

We're using [digitalocean.com](https://digitalocean.com) so these instructions will be specific to that plaform.

### Create and configure droplet

#### Create droplet 

* Go to digitalocean.com and create a new droplet
  * hostname: CoinTipper
  * Size
    * I usually go w/ 2GB/2CPUs $20 month
  * Region
    * San Francisco
  * Linux Distributions
    * Ubuntu 14.04 x64
  * Applications
    * Dokku
  * Add SSH keys

#### Configure hostname

* Copy/Paste IP address into URL bar
  * Put in `hostname`
    * `example.com`
  * Check `Use virtualhost naming for apps
    * `http://<app-name>.example.com`
  * Finish Setup

#### Add DNS

* You'll need a domain for this. For this documentation I'm using `example.com`
* Point your domain's nameservers to digitalocean
  * `ns1.digitalocean.com`
  * `ns2.digitalocean.com`
  * `ns3.digitalocean.com`
* In digitalocean's `DNS` section set an `A-Record` for your `hostname` from your previous step
  * Make the `hostname` be the name of your app
    * `odntip`
  * Make the IP address be the one provided by digitalocean for your droplet.
  * `ping foocointipper.example.com`
    * `PING odntip.example.com (143.143.243.143): 56 data bytes`

#### SSH into your new virualized box

* `ssh root@ip.address.of.virutalized.box`
  * If you correctly added your SSH keys you'll get signed in
  * Remove root login w/ password
    * `sudo nano /etc/ssh/sshd_config`
      * `PermitRootLogin without-password`

#### Compile your coin

For this example I'm using litecoin but the instructions should be similar for most other coins.

* Download the source code
  * `git clone https://github.com/obsidianproject/Obsidian-Qt.git`
* Run the daemon
  * `su obsidian`
  * `cd Obsidian-Qt && obsidiand`    
  * On the first run, obsidiand will return an error and tell you to make a configuration file, named obsidian.conf, in order to add a username and password to the file.
    * `nano ~/.obsidian/obsidian.conf && chmod 0600 ~/.obsidian/obsidian.conf`
    * Add the following to your config file, changing the username and password
    * to something secure. Make sure to take note of the `rpcuser` and * `rpcpassword` because you'll need them in a couple of steps
      * `daemon=1`
      * `staking=0`
      * `enableaccounts=1`
      * `rpcuser=odnrpc`
      * `rpcpassword=odnpass`
      * `rpcport=56661`
      * `rpcthreads=100`
      * `irc=0`
      * `dnsseed=1`
  * Run the daemon again
    * `obsidiand` 
  * To confirm that the daemon is running
    * `obsidiand getinfo`
  * Now wait for the blockchain to sync

#### Clone the CoinTipper Bot git repo

* `git clone https://github.com/cgcardona/slack_tipbot.git`

#### Set up the Slack integration: as an "outgoing webhook" 

* https://yoursite.slack.com/services/new/outgoing-webhook
* Write down the api token they show you in this page
* Set the trigger word. For the litecoin example above we use `litecointipper`
* Set the Url to the server you'll be deploying on http://example.com:4567/tip

#### Give your bot some attitude!

* Copy `coin_config/litecoin.rb` to a file in `coin_config/` and name it after your coin. 
* Open your newly copied file and change the name of the `module` to the same name as your coin. 
* This file contains all the snippets of text, emojis, and variables needed to customize your bot's behavior and attitude 

#### Launch the server!

* `RPC_USER=odnrpc RPC_PASSWORD=odnpass SLACK_API_TOKEN=your_api_key COIN=obsidian bundle exec ruby tipper.rb -p 4567`
  
## Commands

* Tip - send someone coins

  `litecointipper tip @somebody 100`

* Deposit - put coin in

  `litecointipper deposit`

* Withdraw - take coin out

  `litecointipper withdraw LKzHM7rUB2sP1dgVskVFfdSoysnojuw2pX 100`

* Balance - find out how much is in your wallet

  `litecointipper balance`

* Networkinfo - Get the output of getinfo.  Note:  this will disclose the entire aggregate balance of the hot wallet to everyone in the chat

  `litecointipper networkinfo`

## Tested coins

This has been tested w/ 

* btc
* ltc
* florincoin
* doge
* zeta

Please let me know when you try it with other coins so that I can update the list. 

## Security

This runs an unencrypted hot wallet on your server. You should not store significant amounts of cryptocoins in this wallet. Withdraw your tips to an offline wallet often. 

## Credits

This project was originally forked from [dogetip-slack](https://github.com/tenforwardconsulting/dogetip-slack) by [tenforwardconsulting](https://github.com/tenforwardconsulting)

## Support

Like what you see or using this with your team? You can support [the developer](https://github.com/cgcardona) with bitcoin at `1Jwdn9NjhPHkUiEg4gHNaTrYe6s9RkXTs1`

Further the developer is a founding member of the [Blockchain Technology Group](http://blocktech.co) that currently is developing open-source software, hardware and altcoins in the crypto-currency space.  If you would like to support BlockTech, you may donate at `1PYNQ3iUSRrzJjEB2FniGruLaz11vMuPmo`.
